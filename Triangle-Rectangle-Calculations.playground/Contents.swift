//: Playground - noun: a place where people can play

import UIKit


//We will calculate the triangle rectangle

/*
 
    **
    *   *
  A *       *  C
    *           *
    *               *
    *******************
            B
 A** = B** + C**
       __________
 A = \/ B** + C**
 */



// TRIANGLE RECTANGLE - PITAGORAS THEOREM
// Type Float will give us a rounded value
func triangleRectangle(hyp: Float, cat1: Float, cat2: Float)-> Float {
    var result: Float = 0.0
    if cat1 == 0 {
        result = (pow(hyp,2) - pow(cat2,2)).squareRoot()
    } else if cat2 == 0 {
        result = (pow(hyp,2) - pow(cat1,2)).squareRoot()
    } else if hyp == 0 {
        result = pow(cat1,2) + pow(cat2,2)
    }
    return result
}



