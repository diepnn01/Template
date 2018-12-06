//
//  Movie.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/5/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation

public final class Movie: CoreObject {
    
    /// Id from db
    var id              : Int?
    /// Principal title of the Movie
    var title           : String?
    /// Average from votes
    var vote_average    : Float?
    /// Synopsis of the movie or Tv Show
    var overview        : String?
    /// Release date
    var release_date    : String?
    /// Image for poster portrait
    var poster_path     : String?
    /// Image for landscape
    var backdrop_path   : String?
    /// Genre of the item
    var genres          = [Int]()
    /// Name of tv show
    var name            : String?
    /// Type of the item (tv or movie)
    var media_type      : String?
    /// First air date for the Tv Show
    var first_air_date  : String?
    
    public init(data: [AnyHashable : Any]?) {
        id                  = data?["id"] as? Int
        vote_average        = data?["vote_average"] as? Float
        overview            = data?["overview"] as? String
        title               = data?["title"] as? String
        name                = data?["name"] as? String
        release_date        = data?["release_date"] as? String
        poster_path         = data?["poster_path"] as? String
        backdrop_path       = data?["backdrop_path"] as? String
        if let temp = data?["genre_ids"] as? [Int] {
            genres = temp
        }
        media_type          = data?["media_type"] as? String
        first_air_date      = data?["first_air_date"] as? String
    }
}
