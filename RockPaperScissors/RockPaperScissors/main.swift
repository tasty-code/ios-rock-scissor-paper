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

    if isRepeat(RPSResult)
    {
        break
    }
}

while true
{
    if shouldByClose(RPSResult)
    {
        break
    }
    
    let MukJjiPpaResult = try MukJjiPpa().play(RPSResult)

    if shouldByClose(MukJjiPpaResult)
    {
        break
    }
    RPSResult = MukJjiPpaResult
}

func shouldByClose(_ gameResult : String) -> Bool
{
    if gameResult == "exit"
    {
        print("---------------------------------------")
        return true
    }
    else
    {
        return false
    }
}


func isRepeat(_ gameResult : String) -> Bool
{
    if gameResult == "repeat"
    {
        return false
    }
    else
    {
        return true
    }
}

