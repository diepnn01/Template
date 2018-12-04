//
//  AlamofireManager.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/4/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation
import Alamofire
import netfox

final class AlamofireManager: Alamofire.SessionManager {
    
    static let shared: AlamofireManager = {
        
        let configuration = URLSessionConfiguration.default
        
        configuration.protocolClasses?.insert(NFXProtocol.self, at: 0)
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        return AlamofireManager(configuration: configuration)
    }()
}
