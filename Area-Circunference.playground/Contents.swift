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

class SquareArea: Shape {
    override func shape(a: Float, b: Float = 0) -> Float {
        return pow(a, 2)
    }
}

class CircumferenceOfCircle: Shape {
    override func shape(a: Float, b: Float = 0) -> Float {
        return 2 * 3.14 * a
    }
}

class RectangleArea: Shape {
    override func shape(a: Float, b: Float) -> Float {
        return a * b
    }
}
