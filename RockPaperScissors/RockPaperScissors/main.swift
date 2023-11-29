//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation


let user = Player()
let computer = Player()
let gameType = GameType.rockScissorsPaper
var gameMaster = GameMaster(gameType: gameType, user: user, computer: computer, turn: computer)

gameMaster.playGame()
