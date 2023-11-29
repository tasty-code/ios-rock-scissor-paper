//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

let console = Console()
let duo = HandGameDuo(leftPlayer: UserPlayer(io: console, name: "에피"), rightPlayer: UserPlayer(io: console, name: "노움"))
//let duo = HandGameDuo(leftPlayer: UserPlayer(io: console, name: "나야나"), rightPlayer: ComputerPlayer())

RPSApp(io: console, playerDuo: duo).run()
