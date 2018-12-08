//
//  MoviesViewModel.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 12/6/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation
import CoreProject

final class MoviesViewModel {
    
    private var movies = [MoviesCollection]()
    
    var loadMoviewSuccess: DataBinding<ListType>?
    
    // MARK: - Public methods
    init() {
        loadMoviewSuccess = DataBinding()
    }
    
    func getListMovies(type: ListType) {
        
        MovieService.shared.getMovies(type: type).cloudResponse { [weak self](collection: MoviesCollection) in
            guard let `self` = self else { return }
            collection.itemType = type
            self.movies.append(collection)
            self.loadMoviewSuccess?.value = type
            }.cloudError { (msg: String, _: Int?) in
                // TODO: handle show error
            }.finally {
                // TODO: dismiss keyboard
        }
    }
    
    func getObjectList(index: Int) -> MoviesCollection? {
        guard !(index < 0 || index >= movies.count) else {
            return nil
        }
        
        return movies[index]
    }
    
    func getNumberRows() -> Int {
        return movies.count
    }
}
