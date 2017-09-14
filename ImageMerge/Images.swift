//
//  Images.swift
//  ImageMerge
//
//  Created by Geraldo Fernandes on 14/09/17.
//  Copyright © 2017 Geraldo Fernandes. All rights reserved.
//

import Foundation
import AppKit
import CoreImage

struct Images {
    
    func generate() {
        let bundle = Bundle.main
        let firstImagePath = bundle.path(forResource: "nfl1", ofType: "png")!
        let secondImagePath = bundle.path(forResource: "nfl2", ofType: "png")!
        
        let firstImageURL = URL(string: firstImagePath)!
        let secondImageURL = URL(string: secondImagePath)!
        
        let img1 = CIImage(contentsOf: firstImageURL)
        let img2 = CIImage(contentsOf: secondImageURL)
        
        let filter = CIFilter(name: "CIAdditionCompositing")!
        filter.setDefaults()
        
        filter.setValue(img1, forKey: "inputImage")
        filter.setValue(img2, forKey: "inputBackgroundImage")
        
        let resultImage = filter.outputImage
        
        let rep = NSCIImageRep(ciImage: resultImage!)
        let finalResult = NSImage(size: rep.size)
        finalResult.addRepresentation(rep)
        
        finalResult //
    }
}
