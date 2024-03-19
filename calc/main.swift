//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var arguments = ProcessInfo.processInfo.arguments
arguments.removeFirst()// remove the name of the program

Validator(arguments: arguments).checkInputValiditity() // Checks input validity
Validator(arguments: arguments).checkAgainstMaxValue() // Checks input ints are not over the max/min size

var output: (value: Int?, position: Int) = (0,0)

//handle Basic scenario of just 1 number entered. validity already checked above.
if arguments.count == 1 {
    print(Int(arguments[0])!)
}


if arguments.count > 2 {                                 //process calculation passes for valid arguments until result is achieved
    while arguments.count > 2 {
        (output.value, output.position) = Calculator(arguments: arguments).calculate()
        arguments = UpdateArguments(arguments: arguments, resultValue: output.value, resultPosition: output.position).updateArguments()
    }
    print(output.value!)
}
