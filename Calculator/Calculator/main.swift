//
//  main.swift
//  Calculator
//
//  Created by Jevon Gordon on 10/28/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var userResponse : String = ""

repeat {
  let option = Util.getUserInput(message:"Would you like to play (random), (calculator), or (high order)")
  switch option {
  case "high order":
    let response = Util.getUserInput(message: "Enter a operation i.e. filter 1,2,3,4,5 by < 6")
    let highOrderTuple = Util.acceptHighOrderInput(message: response,
                                              errorMessage: "Please try another correctly formatted high order operation")
    if highOrderTuple?.operation == .map {
      guard let result = Util.handleMap(op: (highOrderTuple?.Operator)!,
                                   inputArray: (highOrderTuple?.array)!,
                                   param: (highOrderTuple?.param)!) else { continue}
      print(result)
    } else if highOrderTuple?.operation == .reduce {
      guard let result = Util.handleFilter(op: (highOrderTuple?.Operator)!,
                                      inputArray: (highOrderTuple?.array)!,
                                      param: (highOrderTuple?.param)!) else { continue }
      print(result)
    } else if highOrderTuple?.operation == .filter {
      guard let result = Util.handleReduce(op: (highOrderTuple?.Operator)!,
                                      inputArray: (highOrderTuple?.array)!,
                                      param: (highOrderTuple?.param)!) else { continue }
      print(result)
    } else {
      continue
    }
  case "calculator":
    let calcInput = Util.getUserInput(message: "Enter a simple arithmetic operation i.e. 1 + 4")
    guard let calcTuple = Util.acceptCalculationInput(input: calcInput,
                                                      errorMessage: "Please try another correctly formatted calculator operation")
      else {
        print("Please try another correctly formatted calculator operation")
        continue
    }
    if calcTuple.op != .random {
      let result = calcTuple.op.operate(operandOne: calcTuple.numberOne, operandTwo: calcTuple.numberTwo)
      if result != nil {
        print(result)
      }
//      print("\(calcTuple.numberOne),\(calcTuple.numberTwo),\(result),\(op:calcTuple.op)")
    }
  case "random":
    let calcInput = Util.getUserInput(message: "Enter a random arithmetic operation i.e. 1 ? 4")
    guard let calcTuple = Util.acceptCalculationInput(input: calcInput,
                                                      errorMessage: "Please try another correctly formatted calculator operation")
      else {
        print("Please try another correctly formatted calculator operation")
        continue
    }
    if calcTuple.op == .random {
      let result = calcTuple.op.operate(operandOne: calcTuple.numberOne, operandTwo: calcTuple.numberTwo)
      
      if result != nil {
        print(result!)
        print("Which operation do you think was done? i.e. + - / *")
        if let answer = readLine(){
          if answer == calcTuple.op.rawValue {
            print("You're correct \(calcTuple) was done!")
          } else {
            print("You're incorrect \(calcTuple.op) was done!")
          }
        }
        }
      
    } else {
      print("Please enter a ? between your operands!")
      continue
    }
    
  default:
    continue
  }
  userResponse =  Util.getUserInput(
    message: "Would you like to do more calculations? (Yes) / (No)")
} while (userResponse == "yes")


