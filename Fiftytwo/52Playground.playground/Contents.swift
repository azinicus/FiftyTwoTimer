//: 52 timer playground

import UIKit

let colorsArray = [
    UIColor(red:0.82, green:0.07, blue:0.25, alpha:1.0), //metro red
    UIColor(red:0.0, green:0.69, blue:0.35, alpha:1.0), //metro green
    UIColor(red:0.0, green:0.68, blue:0.86, alpha:1.0), //metro blue
    UIColor(red:0.95, green:0.47, blue:0.21, alpha:1.0), //metro orange
    UIColor(red:1.0, green:0.77, blue:0.15, alpha:1.0) //metro yellow
]

var colorThing = 0

func randomColor() -> UIColor {
    //        Iterative version
    if colorThing < colorsArray.count {
        colorThing++
        return colorsArray[colorThing]
    }
    else {
        return colorsArray[colorThing]
    }
}