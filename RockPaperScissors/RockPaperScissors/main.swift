//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

func main() {
    
    let user = Player(name: "사용자")
    let computer = Player(name: "컴퓨터")
    let gameType = GameType.rockScissorPaper
    var gameMaster = GameMaster(gameType: gameType, user: user, computer: computer, turn: computer)

    
}


main()
