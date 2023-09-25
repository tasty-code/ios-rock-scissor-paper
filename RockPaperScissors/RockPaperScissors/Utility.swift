//
//  Utility.swift
//  RockPaperScissors
//
//  Created by imseonghyeon on 2023/09/08.
//

import Foundation

func shouldByClose(_ gameResult: String) -> Bool
{
    if gameResult == "exit"
    {
        print("---------------------------------------")
        return false
    }
    else
    {
        return true
    }
}

func isRepeat(_ gameResult: String) -> Bool
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
