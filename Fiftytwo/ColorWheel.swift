//
//  ColorWheel.swift
//  Fiftytwo
//
//  Created by Azin Mehrnoosh on 5/30/15.
//  Copyright (c) 2015 Bright Bot, Inc. All rights reserved.
//

import Foundation
import UIKit

struct ColorWheel {
    let colorsArray = [
        UIColor(red:0.82, green:0.07, blue:0.25, alpha:1.0), //metro red
        UIColor(red:0.0, green:0.69, blue:0.35, alpha:1.0), //metro green
        UIColor(red:0.0, green:0.68, blue:0.86, alpha:1.0), //metro blue
        UIColor(red:0.95, green:0.47, blue:0.21, alpha:1.0), //metro orange
        UIColor(red:1.0, green:0.77, blue:0.15, alpha:1.0) //metro yellow
    ]
    
    var colorIndex = 0
    
    mutating func randomColor() -> UIColor {
        
        colorIndex++
        
        if colorIndex < colorsArray.count {
            return colorsArray[colorIndex]
        }
        else {
            colorIndex = 0
            return colorsArray[colorIndex]
        }
        
        
//        Random color changer version
//        var unsignedArrayCount = UInt32(colorsArray.count)
//        var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
//        var randomNumber = Int(unsignedRandomNumber)
//        return colorsArray[randomNumber]
    }
}