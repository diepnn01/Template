//
//  ViewController.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 12/5/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import UIKit
import CoreProject

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        MovieService.shared.getMovies(type: .Popular).cloudResponse { (collection: MoviesCollection) in
            print("ddd")
            }.cloudError { (msg: String, _: Int?) in
                //
            }.finally {
                //
        }
    }


}

