//
//  NumberModel.swift
//  MVVM-Training
//
//  Created by Diep Nguyen on 12/3/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation

public final class NumberModel {
    
    private var value: Int = 0
    
    public init(value: Int) {
        self.value = value
    }
    
    public func getValue() -> Int {
        return value
    }
    
    public func setValue(value: Int) {
        self.value = value
    }
}
