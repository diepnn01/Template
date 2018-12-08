//
//  NSObject+Extension.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 12/8/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation

extension NSObject {
    
    // Name Of class
    class var className: String {
        let name = String(describing: self)
        return name
    }
}
