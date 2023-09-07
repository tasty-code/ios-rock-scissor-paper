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

while true
{
    print("testt")
    // 묵찌빠 디버깅 끝나면 주석 해제하시면 됩니다.
//        let RPSResult : String = try RPS().play()
//
//        if isRepeat(RPSResult)
//        {
//            continue
//        }
        
        let RPSResult = "사용자"
        let MukJjiPpaResult = try MukJjiPpa().play(RPSResult)
        
        if shouldByClose(MukJjiPpaResult)
        {
            break
        }
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
        return true
    }
    else
    {
        return false
    }
}

