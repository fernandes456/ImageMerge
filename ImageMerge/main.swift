//
//  main.swift
//  ImageMerge
//
//  Created by Geraldo Fernandes on 14/09/17.
//  Copyright © 2017 Geraldo Fernandes. All rights reserved.
//

import Foundation
import AppKit
import CoreImage

let images = Images()
images.generate()

//if let p = path {
//    let url = URL(string: p)!
//    print(url)
//} else {
//    print("Could not find path")
//}

//struct Images {
//    static func mergeImages(imageView: NSImageView) -> NSImage {
//        UIGraphicsBeginImageContextWithOptions(imageView.frame.size, false, 0.0)
//        imageView.superview!.layer.renderInContext(UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        return image 
//    }
//}
