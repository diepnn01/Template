//
//  TabbarItem.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 12/6/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import UIKit

enum TabBarItems: String {
    case Movies = "Movies"
    case TvShows = "TV Shows"
}

struct TabbarItem {

    let controller: UIViewController
    let imageEnbled: String
    let imageDisabled: String
    private let controllerName: String
    
    init(itemType: TabBarItems) {
        
        switch itemType {
        case .Movies:
            let storyBoard: UIStoryboard = UIStoryboard(name: "Movies", bundle: nil)
            self.controllerName = "MoviesViewController"
            self.controller = storyBoard.instantiateViewController(withIdentifier: controllerName) as! MoviesViewController
            self.imageEnbled = "MoviesEnabled"
            self.imageDisabled = "MoviesDisabled"
        case .TvShows:
            let storyBoard: UIStoryboard = UIStoryboard(name: "TvShows", bundle: nil)
            self.controllerName = "TvShowsViewController"
            self.controller = storyBoard.instantiateViewController(withIdentifier: controllerName) as! TvShowsViewController
            self.imageEnbled = "TvShowsEnabled"
            self.imageDisabled = "TvShowsDisabled"
        }
    }
}
