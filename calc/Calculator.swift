//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    
    var firstVariable: Int
    var op: String
    var secondVariable: Int
    var startPosition = 0
    
    init(arguments: [String]) {
        
        if let unwrappedfirstvalue = Int(arguments[startPosition]) {
            self.firstVariable = unwrappedfirstvalue
        }
        else {
            exit(1)
        }
        self.op = arguments[startPosition+1]
        if let unwrappedsecondvalue = Int(arguments[startPosition+2]) {
            self.secondVariable = unwrappedsecondvalue
        }
        else {
            exit(1)
        }
        //find the correct (left_number,operator,right_number) set if the current op is not priority operator and setup the calculation step
        if !priorityOperator() {
            nextStep(arguments: arguments)
        }
    }
    
    //will let us know whether selected operator has importance
    func priorityOperator() -> Bool {
        switch op {
        case "+", "-":
            return false
        case "x", "/", "%":
            return true
        default:
            return false
        }
    }
    
    
    
    func nextStep(arguments: [String]) {
        while startPosition < arguments.count-3 && !priorityOperator() {
            startPosition+=2
            firstVariable = Int(arguments[startPosition])!
            op = arguments[startPosition+1]
            secondVariable = Int(arguments[startPosition+2])!
        }
        if startPosition == arguments.count-3 && !priorityOperator() {  //use the first set in the array if none is found
            startPosition = 0
            firstVariable = Int(arguments[0])!    //firstInt and secondInt are previously unwrapped with 'if let' during initialisation
            op = arguments[1]
            secondVariable = Int(arguments[2])!
        }
    }
    // outputs calculation for a single set of (left_number,operator,right_number) from the arguments array
    //returns calculation output and position of result
    func calculate() -> (value: Int?, position: Int) {
        
            var result: Int
            
        if (op == "/" || op == "%") && self.secondVariable == 0 {    //checks for divide operator or modulus division by zero
            ErrorHandler(errorTriggered: "div_by_zero", errorString: "").handleError()
            }
            
            switch op {
            case "+":
                result = self.firstVariable + self.secondVariable
            case "-":
                result = self.firstVariable - self.secondVariable
            case "x":
                result = self.firstVariable * self.secondVariable
            case "/":
                result = self.firstVariable / self.secondVariable
            case "%":
                result = self.firstVariable % self.secondVariable
            default:
                result = 0
                ErrorHandler(errorTriggered: "unknown_operator", errorString: op).handleError()
                //Handle error for unknown operator provided
            }
        //out of integer bounds exception handler
        Validator(arguments: ["\(result)"]).checkAgainstMaxValue()
            return (result, startPosition)
    }
}
