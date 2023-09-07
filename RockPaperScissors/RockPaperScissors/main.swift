//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum ErrorCases: Error
{
    case invalidInput
}

private var RPSResult : String = ""

while true
{
    RPSResult = try RPS().play()

    if RPS().isRepeat(RPSResult)
    {
        break
    }
}

while true
{
    if MukJjiPpa().shouldByClose(RPSResult)
    {
        break
    }
    
    let MukJjiPpaResult = try MukJjiPpa().play(RPSResult)

    if MukJjiPpa().shouldByClose(MukJjiPpaResult)
    {
        break
    }
    RPSResult = MukJjiPpaResult
}






