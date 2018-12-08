//
//  UICollectionView+Extension.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 12/8/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    /// use to register nibs in view
    internal func registerNib(_ nibName: String) {
        let cellNib = UINib.init(nibName: nibName, bundle: nil)
        register(cellNib, forCellWithReuseIdentifier: nibName)
    }
}
