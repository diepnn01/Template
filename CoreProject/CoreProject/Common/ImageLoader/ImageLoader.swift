//
//  ImageLoader.swift
//  CoreProject
//
//  Created by Diep Nguyen on 12/6/18.
//  Copyright © 2018 Diep Nguyen. All rights reserved.
//

import Foundation
import Kingfisher

public final class ImageLoader {
    
    public static func loadImage(imageView: UIImageView, linkUrl: String) {
        let url = AppConstants.domainImage + "w300" + linkUrl
        imageView.kf.setImage(with: URL(string: url), placeholder: nil, options: [], progressBlock: nil, completionHandler: nil)
    }
}
