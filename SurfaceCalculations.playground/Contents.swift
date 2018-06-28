//: Playground - noun: a place where people can play

import UIKit
import Darwin

func cube(side: Float)-> Float {
    return side * side * side
}

func rectagularPrism(a: Float = 0, b: Float = 0, c: Float = 0)-> Float {
    if a == 0 {
        return b * c
    } else if b == 0 {
        return a * c
    } else {
        return a * b
    }
}

// (1/3) b h
func piramid(b: Float = 0, h: Float = 0)-> Float {
    return b == 0 ? h * (1/3) : b * (1/3)
}

// Surface Area of a Cube = 6 a 2
func surfaceAreaOfCube(side: Float)-> Float {
    return side * 6 * 2
}

// Surface Area of a Rectangular Prism = 2ab + 2bc + 2ac
func surfaceAreaOfRectangularPrism(a: Float = 0, b: Float = 0, c: Float = 0)-> Float {
    if a == 0 {
        return (2 * b) + (2 * b * c) + (2 * c)
    } else if b == 0 {
        return (2 * a) + (2 * c) + (2 * a * c)
    } else {
        return (2 * a * b) + (2 * b) + (2 * a)
    }
}

// Surface Area of a Sphere = 4 pi r 2
func surfaceAreaOfSphere(radius: Float)-> Float {
    return radius * 4 * 3.141592 * 2
}

// Surface Area of a Cylinder = 2 pi r2 + 2 pi r h
func surfaceAreaOfCylinder(radius: Float = 0, height: Float = 0)-> Float {
    return radius == 0 ? (2 * 3.141592) + (2 * 3.141592 * height) : (2 * 3.141592 * pow(radius, 2))
}
