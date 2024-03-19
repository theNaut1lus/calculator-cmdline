//
//  validator.swift
//  calc
//
//  Created by Sidak Singh Aulakh on 19/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

struct Validator {
    let arguments: [String]
    let position = 0
    
    func checkInputValiditity() {
        //if expression is complete, should always have odd number of arguments
        if(arguments.count % 2 == 0) {
            ErrorHandler(errorTriggered: "incomplete_expression", errorString: String(arguments.count)).handleError()
        }
        
        //if expression only has 1 input, that is not a number.
        
        if(arguments.count == 1 && Int(arguments[0]) == nil) {
            ErrorHandler(errorTriggered: "invalid_input", errorString: arguments[0]).handleError()
        }
    }
}
