//
//  ServerResponseStatus.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/4/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation

public struct ServerResponseStatus {
    
    /**
     State of server's response.
     */
    public enum ResponseState {
        case success
        case error(code: Int)
    }
    
    // MARK: - Public properties
    
    public let state: ResponseState
    
    /**
     Corresponding message along with the `state`.
     */
    public let message: String
    
    
    public init(state: ResponseState, message: String) {
        self.state = state
        self.message = message
    }
    
    public init(errorCode: Int, errorMessage: String) {
        
        self.state = ServerResponseStatus.responseState(for: errorCode)
        self.message = errorMessage
    }
    
    // MARK: - Private methods
    
    static private func responseState(for errorCode: Int) -> ResponseState {
        
        if errorCode == 200 {
            return .success
        }
        return .error(code: errorCode)
    }
}
