//
//  ServerResponseObject.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/4/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation

public class ServerResponseObject: CoreObject {
    
    public var status: ServerResponseStatus?
    
    required public init(data: [AnyHashable: Any]?) {
        
        // TODO: revisit to update key base on different projects
        if let errorCode = data?["status_code"] as? Int, let errorMessage = data?["message"] as? String {
            self.status = ServerResponseStatus(errorCode: errorCode, errorMessage: errorMessage)
        }
    }
}
