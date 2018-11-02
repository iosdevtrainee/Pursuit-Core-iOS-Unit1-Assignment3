//
//  Operators.swift
//  Calculator
//
//  Created by J on 10/30/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

enum Operators: String, CaseIterable {
  case add = "+"
  case subtract = "-"
  case multiply = "*"
  case division = "/"
  case random = "?"
  case filter = "filter"
  case map = "map"
  case reduce = "reduce"
  case none = "none"
  // only for readibility sake
  func operate(operandOne:Double, operandTwo:Double) -> Double? {
    switch self.rawValue {
    case "+":
      let addition = Util.mathStuffFactory(opString: self.rawValue)
      return addition(operandOne, operandTwo)
    case "-":
      let subtraction = Util.mathStuffFactory(opString: self.rawValue)
      return subtraction(operandOne, operandTwo)
    case "*":
      let multiplication = Util.mathStuffFactory(opString: self.rawValue)
      return multiplication(operandOne, operandTwo)
    case "/":
      let division = Util.mathStuffFactory(opString: self.rawValue)
      guard operandTwo != 0 else {
        print("Divsion by zero is not a valid operation. Try again!")
        return nil
      }
      return division(operandOne, operandTwo)
    case "?":
      let random = Int.random(in: 0...4)
      let randomOperation = Util.mathStuffFactory(opString: Operators.allCases[random].rawValue)
      if random == 3 && operandTwo == 0 {
        return nil
      }
      return randomOperation(operandOne,operandTwo)
    default:
      return nil
    }
  }
}
