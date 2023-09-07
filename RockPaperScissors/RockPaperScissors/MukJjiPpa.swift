//
//  MukJjiPpa.swift
//  RockPaperScissors
//
//  Created by imseonghyeon on 2023/09/07.
//

import Foundation

class MukJjiPpa
{
    
    func isUserTurn(_ gameResult : String) -> String
    {
        if gameResult == "UserTurn"
        {
            return "user"
        }
        else
        {
            return "computer"
        }
    }
    
}
