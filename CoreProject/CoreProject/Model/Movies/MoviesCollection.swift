//
//  MoviesCollection.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/5/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation

public final class MoviesCollection: ServerResponseObject {
    
    public var page = 1
    public var total_results: Int = 0
    public var total_pages: Int = 0
    public var objectList = [Movie]()
    public var itemType: ListType?
    
    public required init(data: [AnyHashable : Any]?) {
        super.init(data: data)
        
        if let temp = data?["page"] as? Int {
            page = temp
        }
        
        if let temp = data?["total_results"] as? Int {
            total_results = temp
        }
        
        if let temp = data?["total_pages"] as? Int {
            total_pages = temp
        }
        
        if let temps = data?["results"] as? [[AnyHashable: Any]] {
            objectList = temps.map({ (item: [AnyHashable: Any]) -> Movie in
                return Movie(data: item)
            })
        }
    }
}
