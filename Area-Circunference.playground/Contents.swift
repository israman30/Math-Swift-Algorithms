//: Playground - noun: a place where people can play

import UIKit

// WE USE A SHAPE CLASS TO REFER TO ANY FIGURE "GLOBAL CLASS"
class Shape {
    public func shape(a: Float, b: Float)-> Float{
        return 0.0
    }
    
    deinit {
        print("Deinit")
    }
}

class Triangle: Shape {
    
    override func shape(a: Float, b: Float) -> Float {
        return (b * a) / 2
    }
}
