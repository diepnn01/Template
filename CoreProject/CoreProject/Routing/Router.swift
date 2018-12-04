//
//  Router.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/4/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation
import Alamofire

enum Environment {
    case development
    case staging
    case production
}

public class Router {
    
    static var environment: Environment {
        #if DEV
        return .development
        #elseif STAGING
        return .staging
        #else
        return .production
        #endif
    }
    
    static private(set) var host: String = "https://api.themoviedb.org/3"
    
    static var baseUrl: String {
        switch environment {
        case .development:
            host = "http://carnivalbkk.crystal-techs.com"
        case .staging:
            host = "https://stg-carnivalbkk.mgfdev.com"
        case .production:
            host = "http://carnivalbkk.crystal-techs.com"
        }
        return "\(host)/dev"
    }
    
    public static func setHost(endpoint: String) {
        host = endpoint
    }
    
    func buildUrlRequest(_ route: Route) -> URLRequestConvertible {
        return RouterUrlConvertible(route: route)
    }
    
    func buildValidFullPathForRequest(_ path: String) -> String {
        if let url = URL(string: Router.baseUrl) {
            return url.appendingPathComponent(path).absoluteString
        }
        return path
    }
}
