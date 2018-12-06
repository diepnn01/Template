//
//  MovieRouter.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/6/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation
import Alamofire

public final class MovieRouter: Router {
    
    func getMovies(type: ListType) -> URLRequestConvertible {
        let path = buildValidFullPathForRequest(getEndPoint(type: type, screenType: .Movie))
        let params = ["api_key": "b42de0d7051793f886f6c0569505a420"]
        return buildUrlRequest(Route(method: .get, path: path, queryParams: params))
    }
    
    func getTvShows(type: ListType) -> URLRequestConvertible {
        let path = buildValidFullPathForRequest(getEndPoint(type: type, screenType: .TvShow) + AppConstants.keyPath + AppConstants.apiKey)
        let params = ["api_key": "b42de0d7051793f886f6c0569505a420"]
        return buildUrlRequest(Route(method: .get, path: path, queryParams: params))
    }
    
    private func getEndPoint(type: ListType, screenType: TypeScreen) -> String {
        switch type {
        case .Popular:
            return screenType == .Movie ? MoviesEndPoint.getPopular.rawValue : TvShowsEndPoint.getPopularTv.rawValue
        case .TopRate:
            return screenType == .Movie ? MoviesEndPoint.getTopRates.rawValue : TvShowsEndPoint.getTopRatesTv.rawValue
        case .Upcoming:
            return screenType == .Movie ? MoviesEndPoint.getUpcomings.rawValue : TvShowsEndPoint.getUpcomingsTv.rawValue
        }
    }
}
