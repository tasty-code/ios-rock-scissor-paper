//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

let rockPaperScissorsManager = RockPaperScissorsManager()
let advancedRockPaperScissorsManager = AdvancedRockPaperScissorsManager(rockPaperScissorsManager: rockPaperScissorsManager)

let rockPaperScissorsResult = rockPaperScissorsManager.playGame(.default)

switch rockPaperScissorsResult {
case .exit:
    break
default:
    advancedRockPaperScissorsManager.playGame(rockPaperScissorsResult)
}

