//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Movie {
    let name: String
    var date: Int?
    
    init(_ name: String) {
        self.name = name
    }
}

var movieA = Movie("A")
var movieB = Movie("B")
var movieC = Movie("C")

let movies = [movieB, movieC, movieA]
let randomNum = Int(arc4random_uniform(2))

print(randomNum)
print(randomNum)

