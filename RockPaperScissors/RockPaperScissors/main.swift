//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

let console = Console()
//let duo = (UserPlayer(io: console, name: "나야나"), UserPlayer(io: console, name: "저요저"))
let duo = (UserPlayer(io: console, name: "나야나"), ComputerPlayer())

RPSApp(io: console, playerDuo: duo).run()
