//
//  MoviesService.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/4/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import UIKit
import Alamofire

public final class MovieService {

    public static let shared = MovieService()
    
    private let router = MovieRouter()
    
    public func getMovies(type: ListType) -> ServiceRequest<MoviesCollection> {
        let request = ServiceRequest<MoviesCollection>()
        AlamofireManager.shared.request(router.getMovies(type: type)).responseJSON { (response: DataResponse<Any>) in
            request.handleResponseJSON(response: response)
        }
        return request
    }
    
    public func getTvShows(type: ListType) -> ServiceRequest<MoviesCollection> {
        let request = ServiceRequest<MoviesCollection>()
        AlamofireManager.shared.request(router.getTvShows(type: type)).responseJSON { (response: DataResponse<Any>) in
            request.handleResponseJSON(response: response)
        }
        return request
    }
}
