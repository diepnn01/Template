//
//  UITableView.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell(nibName: String...) {
        
        for name in nibName {
            self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
        }
    }
}
