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

class AreaOfCircle: Shape {
    override func shape(a: Float, b: Float = 0) -> Float {
        return pow(a, 2) * 3.14
    }
}

class Cylinder: Shape {
    override func shape(a: Float, b: Float) -> Float {
        return (2 * 3.14 * a * b) + (2 * 3.14 * pow(a, 2))
    }
}

// CILINDER AREA
let cylinder = Cylinder()
cylinder.shape(a: 3.2, b: 2.1)

// AREA OF A CRICLE
let circleArea = AreaOfCircle()
circleArea.shape(a: 3.6)

// RECTANGLE AREA
let rectangle = RectangleArea()
rectangle.shape(a: 5, b: 4)

// CRICUNFERENCE OF A CIRCLE
let circumference = CircumferenceOfCircle()
circumference.shape(a: 2.3)

// AREA OF A SQUARE
let square = SquareArea()
square.shape(a: 5)

// AREA OF A TRIANGLE
let triangle = Triangle()
triangle.shape(a: 34.52, b: 23.5)

let shape = Triangle()
shape.shape(a: 2.5, b: 3)


