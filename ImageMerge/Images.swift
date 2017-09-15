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
//        let bundle = Bundle.main
//        let firstImagePath = bundle.path(forResource: "nfl1", ofType: "png")!
//        let secondImagePath = bundle.path(forResource: "nfl2", ofType: "png")!
//        
//        let firstImageURL = URL(string: firstImagePath)!
//        let secondImageURL = URL(string: secondImagePath)!
//        
//        let img1 = CIImage(contentsOf: firstImageURL)
//        let img2 = CIImage(contentsOf: secondImageURL)
//        
//        let filter = CIFilter(name: "CIAdditionCompositing")!
//        filter.setDefaults()
//        
//        filter.setValue(img1, forKey: "inputImage")
//        filter.setValue(img2, forKey: "inputBackgroundImage")
//        
//        let resultImage = filter.outputImage
//        
//        let rep = NSCIImageRep(ciImage: resultImage!)
//        let finalResult = NSImage(size: rep.size)
//        finalResult.addRepresentation(rep)
//        
//        finalResult //

        
        let bundle = Bundle.main
        let firstImagePath = bundle.path(forResource: "nfl1", ofType: "png")!
        let secondImagePath = bundle.path(forResource: "nfl2", ofType: "png")!
        
//        let firstImageURL = URL(string: firstImagePath)!
//        let secondImageURL = URL(string: secondImagePath)!
        
        let firstImage  = NSImage(byReferencingFile: firstImagePath)! //1200x630
        let secondImage  = NSImage(byReferencingFile: secondImagePath)!
        let finalImage = NSImage(size: NSMakeSize(firstImage.size.width * 2, firstImage.size.height))
        
        finalImage.lockFocus()
        firstImage.draw(in: NSMakeRect(0, 0, firstImage.size.width, firstImage.size.height))
        secondImage.draw(in: NSMakeRect(firstImage.size.width, 0, firstImage.size.width, firstImage.size.height))
        finalImage.unlockFocus()
        
//        let picture  = NSImage(byReferencingFile: firstImagePath)!
        let finalImageURL = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!.appendingPathComponent("gfsf-temp.png")
        if finalImage.savePNG(to: finalImageURL) {
            print("image saved as PNG")
        }
    }
}

extension NSBitmapImageRep {
    var png: Data? {
        return representation(using: .PNG, properties: [:])
    }
}
extension Data {
    var bitmap: NSBitmapImageRep? {
        return NSBitmapImageRep(data: self)
    }
}
extension NSImage {
    var png: Data? {
        return tiffRepresentation?.bitmap?.png
    }
    func savePNG(to url: URL) -> Bool {
        do {
            try png?.write(to: url)
            return true
        } catch {
            print(error)
            return false
        }
        
    }
}
