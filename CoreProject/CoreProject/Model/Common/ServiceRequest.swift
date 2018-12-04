//
//  ServerRequest.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/4/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation
import Alamofire

public final class ServiceRequest<T: CoreObject> {
    
    private var cloudResponseClosure: ((T) -> Void)?
    private var cloudErrorClosure: ((_ status: String, _ code: Int?) -> Void)?
    private var finallyClosure: (() -> Void)?
    
    var cachedResult: T!
    
    public init() {
        self.cloudResponseClosure = nil
        self.cloudErrorClosure = nil
    }
    
    @discardableResult
    func cloudResponse(_ closure: ((T) -> Void)? = nil) -> Self {
        self.cloudResponseClosure = closure
        return self
    }
    
    @discardableResult
    func cloudError(_ closure: ((_ status: String, _ code: Int?) -> Void)? = nil) -> Self {
        self.cloudErrorClosure = closure
        return self
    }
    
    @discardableResult
    func finally(_ closure: (() -> Void)?) -> Self {
        self.finallyClosure = closure
        return self
    }
    
    func handleResponseJSON(response: DataResponse<Any>, isLogin: Bool = false) {
        defer {
            finallyClosure?()
        }
        
        switch response.result {
        case .success(let value):
            if let resource = value as? [AnyHashable: Any] {
                let obj = T(data: resource)
                cloudResponseClosure?(obj)
            } else {
                cloudErrorClosure?("Bad format", 500)
            }
        case .failure(let error):
            handleError(response: response, error: error)
        }
    }
    
    func handleResponseJSONArray(response: DataResponse<Any>) {
        defer {
            finallyClosure?()
        }
        
        switch response.result {
        case .success(let value):
            if let resource = value as? [[AnyHashable: Any]] {
                let items = [
                    "items": resource
                ]
                let obj = T.init(data: items as [AnyHashable: Any])
                cloudResponseClosure?(obj)
            }
            else {
                cloudErrorClosure?("Bad format", 500)
            }
        case .failure(let error):
            handleError(response: response, error: error)
        }
    }
    
    fileprivate func handleError(response: DataResponse<Any>, error: Error) {
        if let responseData = response.data, let errorData = try? JSONSerialization.jsonObject(with: responseData) as? [String:Any] {
            if let message = errorData?["message"] as? String {
                cloudErrorClosure?(message, response.response?.statusCode)
            }
            else if let errors = errorData?["errors"] as? [NSDictionary], errors.count > 0, let message = errors[0]["message"] as? String {
                cloudErrorClosure?(message, response.response?.statusCode)
            }
            else {
                cloudErrorClosure?("\(String(describing: errorData))", response.response?.statusCode)
            }
        }
        else {
            cloudErrorClosure?("\(error)", response.response?.statusCode)
        }
    }
}
