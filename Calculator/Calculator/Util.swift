//
//  Util.swift
//  Calculator
//
//  Created by J on 11/2/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

class Util {
  static func map(array: [Double], closure:(Double) -> Double?) -> [Double]? {
    var resultArray = [Double]()
    for element in array {
      guard let result = closure(element) else { return nil }
      resultArray.append(result)
    }
    return resultArray
  }
  
  static func reduce(array:[Double], intialValue:Double, closure: (Double, Double) -> Double?) -> Double? {
    // iterate
    // past the current element
    // remember the last element
    var lastelm = intialValue
    for element in array {
      guard let result = closure(lastelm, element) else { return nil }
      lastelm = result
    }
    return lastelm
  }
  
  static func filter(array:[Double], closure: (Double) -> Bool) -> [Double] {
    var answer = [Double]()
    for element in array {
      if closure(element){
        answer.append(element)
      }
    }
    return answer
  }
  static func getUserInput(message:String) -> String {
    print(message)
    guard let response = readLine() else {return ""}
    return response.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
  }
  
  static func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
    switch opString {
    case "+":
      return {x, y in x + y }
    case "-":
      return {x, y in x - y }
    case "*":
      return {x, y in x * y }
    case "/":
      return {x, y in x / y }
    default:
      return {x, y in x + y }
    }
  }
  
  static func acceptHighOrderInput(message:String, errorMessage:String) ->
    (operation:Operators,array:[Double],Operator:Operators,param:Double)? {
      print(message)
      let input = readLine()
      guard let userInput = input else {
        print(errorMessage)
        return nil
      }
      let tokens = userInput.components(separatedBy: " ")
      guard let operation = Operators.init(rawValue:tokens[0]) else {
        print(errorMessage)
        return nil
      }
      let arrayOfInts = tokens[1].components(separatedBy: ",").compactMap{ Double($0)}
      guard let Operator = Operators.init(rawValue:tokens[3]) else {
        print(errorMessage)
        return nil
      }
      guard let param = Double(tokens[4]) else {
        print(errorMessage)
        return nil
      }
      return (operation:operation,array:arrayOfInts,Operator:Operator,param:param)
  }
  
  static func acceptCalculationInput(message:String, errorMessage:String) ->
    (numberOne:Double,numberTwo:Double, op:Operators)? {
      print(message)
      let input = readLine()
      guard let inputArray = input?.components(separatedBy: " ") else {
        print(errorMessage)
        return nil
      }
      guard let num1 = Double(inputArray[0]) else {
        print(errorMessage)
        return nil
      }
      guard let num2 = Double(inputArray[2]) else {
        print(errorMessage)
        return nil
      }
      guard let op = Operators.init(rawValue:(inputArray[1])) else {
        print(errorMessage)
        return nil
      }
      return (numberOne:num1,numberTwo:num2,op:op)
  }
  static func handleFilter(op:Operators,inputArray:[Double], param:Double) -> [Double]? {
    switch op.rawValue {
    case "<":
      return Util.filter(array: inputArray){$0 < param}
    case ">":
      return Util.filter(array: inputArray) {$0 > param}
    case "!":
      return Util.filter(array: inputArray) {$0 != param}
    case "=":
      return Util.filter(array: inputArray) {$0 == param}
    default:
      return nil
    }
    
  }
  
  static func handleMap(op:Operators,inputArray:[Double], param:Double) -> [Double]? {
    switch op.rawValue {
    case "+":
      return map(array: inputArray) {$0 + param}
    case "-":
      return map(array: inputArray) {$0 - param}
    case "*":
      return map(array: inputArray) {$0 * param}
    case "/":
      return map(array: inputArray) {$0 / param}
    default:
      return nil
    }
  }
  
  static func handleReduce(op:Operators,inputArray:[Double], param:Double) -> Double? {
    switch op.rawValue {
    case "<":
      return Util.reduce(array: inputArray, intialValue: param){$0 < $1 ? $1: $0}
    case ">":
      return Util.reduce(array: inputArray, intialValue: param) {$0 > $1 ? $0 : $1}
    case "!":
      return Util.reduce(array: inputArray, intialValue: param) {$0 != $1 ? $0 : $1}
    case "=":
      return Util.reduce(array: inputArray, intialValue: param) {$0 == $1 ? $0 : $1}
    default:
      return nil
    }
  }
}


