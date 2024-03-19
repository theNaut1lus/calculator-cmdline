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
        while startPosition < args.count-3 && !priorityOperator() {
            startPosition+=2
            firstVariable = Int(args[startPosition])!
            op = args[startPosition+1]
            secondVariable = Int(args[startPosition+2])!
        }
        if startPosition == args.count-3 && !priorityOperator() {  //use the first set in the array if none is found
            startPosition = 0
            firstVariable = Int(args[0])!    //firstInt and secondInt are previously unwrapped with 'if let' during initialisation
            op = args[1]
            secondVariable = Int(args[2])!
        }
    }
    
    func calculate(args: [String]) -> String {
        result = 0
        return(result)
    }
}
