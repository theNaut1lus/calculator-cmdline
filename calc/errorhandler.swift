//
//  errorhandler.swift
//  calc
//
//  Created by Sidak Singh Aulakh on 19/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

class ErrorHandler {
    let errorTriggered: String
    let errorString: String
    
    init(errorTriggered: String, errorString: String) {
        self.errorTriggered = errorTriggered
        self.errorString = errorString
    }
    
    func handleError() {
        switch errorTriggered {
        case "invalid_input":
            print("Invalid number: \(self.errorString)")
            exit(1)
        case "int_overflow":
            print("Integer Overflow: \(self.errorString) > 9223372036854775807")
            exit(2)
        case "div_by_zero":
            print("Division by zero")
            exit(3)
        case "unknown_operator":
            print("Unknown operator: \(self.errorString)")
            exit(4)
        case "incomplete_expression":
            print("Unknown operator: \(self.errorString)")
            exit(4)
        default:
            print("Unknown error occured, please try again: \(self.errorString)")
            exit(5)
        }
    }
}
