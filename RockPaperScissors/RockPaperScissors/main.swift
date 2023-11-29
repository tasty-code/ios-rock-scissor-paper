//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

let console = Console()
//let duo = HandGameDuo(UserPlayer(io: console, name: "에피"), UserPlayer(io: console, name: "노움"))
let duo = HandGameDuo(UserPlayer(io: console, name: "에피"), ComputerPlayer())

HandGameApp(playerDuo: duo, errorDisplay: console).run()
