//
//  MoviesTest.swift
//  MVVM-TrainingTests
//
//  Created by Diep Nguyen on 12/12/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import XCTest
@testable import MVVM_Training
@testable import CoreProject

class MoviesTest: XCTestCase {

    var movieService = MovieService()
    var movieViewModel: MoviesViewModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        movieViewModel = MoviesViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        movieService.getMovies(type: .Popular).cloudResponse { (collection: MoviesCollection) in
            //
            }.cloudError { ( msg: String, _: Int?) in
                XCTAssert(false, msg)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
