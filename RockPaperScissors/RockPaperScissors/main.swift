//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

private let rockPaperScissorsManager = RockPaperScissorsManager()
private let advancedRockPaperScissorsManager = AdvancedRockPaperScissorsManager(rockPaperScissorsManager: rockPaperScissorsManager)

private let rockPaperScissorsResult = rockPaperScissorsManager.playGame(.default)

switch rockPaperScissorsResult {
case .exit:
    break
default:
    advancedRockPaperScissorsManager.playGame(rockPaperScissorsResult)
}

