//
//  ImageLoader.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/6/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation
import Kingfisher

final class ImageLoader {
    
    static func loadImage(imageView: UIImageView, linkUrl: String) {
        imageView.kf.setImage(with: URL(string: linkUrl), placeholder: nil, options: [], progressBlock: nil, completionHandler: nil)
    }
}
