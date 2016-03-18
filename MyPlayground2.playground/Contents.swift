//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var newstring = str + " Josh"


for character in newstring.characters {
    print(character)
}


var newTypeString = NSString(string: newstring)

newTypeString.substringToIndex(5)

newTypeString.substringFromIndex(6)

newTypeString.substringWithRange(NSRange(location: 3, length: 5))

if newTypeString.containsString("Josh") {
    //Josh is there
}

newTypeString.componentsSeparatedByString(" ")

newTypeString.uppercaseString

newTypeString.lowercaseString