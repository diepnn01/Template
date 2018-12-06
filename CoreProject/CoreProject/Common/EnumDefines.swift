//
//  EnumDefine.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/6/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation

enum TypeScreen {
    case Movie
    case TvShow
}

public enum ListType: String{
    case Popular
    case TopRate = "Top Rate"
    case Upcoming
}

enum MoviesEndPoint: String {
    case getPopular  = "movie/popular"
    case getTopRates = "movie/top_rated"
    case getUpcomings  = "movie/upcoming"
    case getGenres = "genre/movie/list"
}

enum TvShowsEndPoint: String {
    case getPopularTv  = "/tv/popular"
    case getTopRatesTv = "/tv/top_rated"
    case getUpcomingsTv = "/tv/airing_today"
}
