//
//  TvShowsViewModel.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 12/6/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import UIKit
import CoreProject

final class TvShowsViewModel {

    private var tvShows = [MoviesCollection]()
    
    var loadTvShowSuccess: DataBinding<ListType>?
    init() {
        loadTvShowSuccess = DataBinding()
    }
    func getTvShow(type: ListType) {
        
        MovieService.shared.getTvShows(type: type).cloudResponse { [weak self](collection: MoviesCollection) in
            guard let `self` = self else { return }
            collection.itemType = type
            self.tvShows.append(collection)
            self.loadTvShowSuccess?.value = type
            }.cloudError { (msg: String, _: Int?) in
                // TODO: Hanlde case error
            }.finally {
                //
        }
    }
    
    func getObjectList(index: Int) -> MoviesCollection? {
        guard !(index < 0 || index >= tvShows.count) else {
            return nil
        }
        
        return tvShows[index]
    }
    
    func getNumberRows() -> Int {
        return tvShows.count
    }
}
