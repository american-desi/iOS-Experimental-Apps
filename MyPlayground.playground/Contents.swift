//: Playground - noun: a place where people can play

import UIKit

//Strings

var str = "Hello, playground"

var name:String = "Joshua Thomas"

print("Hello " + name + "! ")

//Integers

var INT:Int = 1000

INT = INT / 2

var anotherInt = 7

print(INT + anotherInt)

print("The value of int is \(INT)")

//Doubles

var number:Double = 2.75

print(number * Double(INT))

//Booleans

var isMale:Bool = true



//double and integer multiply them and give the result as part of a string


var doub:Double = 8.0
var inte:Int = 6
var multi = doub * Double(inte)
print("The value of our double (8.0) and int (6) equals \(multi)")



//Arrays

var array = [17, 25, 13, 47]

print(array[2])

print(array.count)

array.append(56)

array.removeAtIndex(3)

print(array)

array.sort()


//challenge: arr of 3 diff number remove middle one and add an item which is the two multiplied

var arr = [5, 10, 15]

arr.removeAtIndex(1)
arr.append(5 * 15)
print(arr)


//Dictionaries

var dictionary = ["computer": "something to play Call of Duty on", "poop": "an item to throw"]


print(dictionary["computer"]!)

print(dictionary.count)

dictionary["pen"] = "a writing instrumnet"

dictionary.removeValueForKey("poop")

print(dictionary)



//challenge dictionary prices of 3 items on menu and print total cost

var menu = ["shrimp" : 14.99, "caviar" : 19.99, "lobster" : 39.99]

var totalCost = menu["shrimp"]! + menu["caviar"]! + menu["lobster"]!

print("The total cost is \(totalCost)")


//if statements

var age = 20

if age > 18 {
    print("You're old enough!")
}else{
    print("Try again when you are older than 18")
}


//for loops

for (var i = 1; i < 10; i++) {
    print(i)
}

var arr2 = [2, 4, 6, 8]

for x in arr2 {
    print(x)
}

for (index, value) in arr2.enumerate() {
    
    arr2[index] = value / 2
}

print(arr2)




// while loops 


var i = 1

while i < 3 {
    
    i++
}


var arr3 = [0, 3, 1, 9, 4, 5, 6]

var i2 = 0

while i2 < arr.count {
    
    print(arr3[i2])
    i2++
}


//testing isitPrime

















