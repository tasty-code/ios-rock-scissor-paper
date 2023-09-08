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

private var RPSResult: String = "repeat"

while isRepeat(RPSResult)
{
    RPSResult = try RPS().play(RPSResult)
}

while shouldByClose(RPSResult)
{
    let MukJjiPpaResult = try MukJjiPpa().play(RPSResult)
    RPSResult = MukJjiPpaResult
}
