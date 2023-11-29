//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation


let user = Player()
let computer = Player()
var gameMaster = GameMaster(user: user, computer: computer)

gameMaster.playGame()
