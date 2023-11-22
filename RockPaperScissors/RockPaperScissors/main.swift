//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

enum RockPaperScissors: String, CaseIterable, CustomStringConvertible {
    case quit = "0"
    case rock = "1"
    case paper = "2"
    case scissors = "3"
    case error = ""
    
    var description: String {
        switch self {
        case .quit:
            "종료"
        case .rock:
            "바위"
        case .paper:
            "보"
        case .scissors: 
            "가위"
        case .error:
            ""
        }
    }
}

enum Role {
    case user
    case computer
}

struct Player {
    let player: Role
    
    init(player: Role){
        self.player = player
    }
    
    func choose() -> RockPaperScissors {
        if player == .user {
            guard let input:String = readLine() else {
                return RockPaperScissors.error
            }
            guard let userSelection = RockPaperScissors(rawValue: input) else {
                return RockPaperScissors.error
            }
            switch userSelection {
            case RockPaperScissors.quit:
                return RockPaperScissors.quit
            case RockPaperScissors.rock:
                return RockPaperScissors.rock
            case RockPaperScissors.paper:
                return RockPaperScissors.paper
            case RockPaperScissors.scissors:
                return RockPaperScissors.scissors
            case RockPaperScissors.error:
                return RockPaperScissors.error
            }
        } else {
            let allCases = RockPaperScissors.allCases
            let randomIndex = Int.random(in: 1...3)
            return allCases[randomIndex]
        }
    }
}

struct GameManager {
    func printGameMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
}

let gameManager = GameManager()
let user = Player(player: .user)
let computer = Player(player: .computer)
gameManager.printGameMenu()
print(user.choose())
print(computer.choose())

