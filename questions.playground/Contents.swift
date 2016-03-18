//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let numberList: Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func linearSearch(key: Int) {
    
    for number in numberList {
        if(number == key) {
            print("value \(key) found...")
            break
        }
    }
}

linearSearch(10)


//func binarySearch(sequence: Array<Int>, key: Int) {
//    
//        //establish indices - extensions
//        let min = sequence.minIndex()
//        let max = sequence.maxIndex()
//        let mid = sequence.midIndex()
//    
//        //check bounds
//    if key > sequence[max] || key < sequence[min] {
//        print("search value \(key) not found..")
//        return
//    }
//    
//    //evaluate chosen number
//     let n = sequence[mid]
//    
//    if n > key {
//        let slice: Array<Int> = Array(sequence[min..mid - 1])
//        self.binarySearch(slice, key: key)
//    }
//    if n < key {
//        let slice: Array<Int> = Array(sequence[mid + 1...max])
//        self.binarySearch(slice, key:key)
//    }else {
//        print("search value \(key) found..")
//        return
//    }
//}


var number1 = arc4random()
var number2 = arc4random()

var solution = number1 * number2


while (true) {
    printQuestion();
    char c = readInput();
    if (!isLegalInput(c)) continue; // i.e., jump to the loop start to ask again
    if (isCorrectAnswer(c)) {
        print("Correct!\n\n");
    } else {
        print("Inorrect!\n\n");
    }
}





















