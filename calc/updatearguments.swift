//
//  updatearguments.swift
//  calc
//
//  Created by Sidak Singh Aulakh on 19/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

struct UpdateArguments {
    
    let arguments: [String]
    let resultValue: Int?
    let resultPosition: Int
    
    //After result has been processed, updates the argument list for the next pass.
    func updateArguments() -> [String] {
        
        //Scenario when the last calculation has been done, just return the final result value
        if resultPosition == 0 && arguments.count == 3 {
            return  ["\(resultValue!)"]
            
        }
        // Handles scenario where the calculation has happened on the start of the list and we have further list elements present in the arguments list
        else if resultPosition == 0 && arguments.count > 1 && arguments.count > 3 {
            return ["\(resultValue!)"]  + Array(arguments[resultPosition + 3...arguments.count - 1])
            
        } 
        //Handles scenario wherein the calculation is in the middle, we have elements on the left and right.
        else if resultPosition > 0 && resultPosition < arguments.count-3  {
            return Array(arguments[0...resultPosition - 1]) + ["\(resultValue!)"] + Array(arguments[resultPosition + 3...arguments.count - 1])
            
        }
        //Last possible scenario wherein the calculation is the rightmost set, with elements on the left of the arguments list.
        else  {
            return Array(arguments[0...resultPosition - 1]) + ["\(resultValue!)"]
            
        }
    }
}
