//
//  main.swift
//  Calculator
//
//  Created by Jevon Gordon on 10/28/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

//print(Util.reduce(array: "1 2 3 5", intialValue: "") { $0 + $1})
//print(Util.filter(array: "1 2 3 5"]) {Int($0) != nil ? Int($0)! % 2 == 0 ? true : false : false})
//print(Util.map(array: "1 2 3 5") { Int($0) != nil ? Int($0)! * 2 : Int.min })
//let input = Util.getUserInput(message: "Let's do some calculations. E.g. 1 + 2 = 3")
//let Operator = Util.filter(array: input){"+-/*?".contains($0)}
//let nums = Util.filter(array: input){Double($0) != nil} needs to be able to handle cases greater than 9

var userResponse : String = ""

//guard input != "" && Operator.count == 1 && nums.count == 2 else {
//  print("Please enter a calculation i.e. 1 * 5")
//  continue
//}



repeat {
  
    print("The result of \(Int(firstOperand)) \(op!.rawValue) \(Int(secondOperand)) = \(result)")
  }
  userResponse =  Util.getUserInput(
    message: "Would you like to do more calculations? (Yes) / (No)")
} while (userResponse == "yes")


