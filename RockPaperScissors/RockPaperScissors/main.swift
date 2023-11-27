//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

var run: Bool = true
var menuMessage: MenuMessage = .rps

struct Player {
    var input: RockPaperScissor
}

enum RockPaperScissor: Int {
    case gameOver = 0,
         rock = 1,
         paper = 2,
         scissor = 3,
         noChoice = 4
}

func convertInputToRockPaperScissor(_ input: Int) -> RockPaperScissor {
    switch input {
    case 0:
        return .gameOver
    case 1:
        return .rock
    case 2:
        return .paper
    case 3:
        return .scissor
    default:
        return .noChoice
    }
}

enum RpsGameResult: CustomStringConvertible {
    case win, draw, lose
    
    var description: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .draw:
            return "비겼습니다!"
        case .lose:
            return "졌습니다!"
        }
    }
    
    func isOver() -> Bool {
        switch self {
        case .win, .lose:
            return false
        case .draw:
            return true
        }
    }
}

enum MenuMessage: CustomStringConvertible {
    case rps
    
    var description: String {
        switch self {
        case .rps:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        }
    }
}

func readInput() -> RockPaperScissor {
    if let input = Int(readLine() ?? "") {
        return convertInputToRockPaperScissor(input)
    } else {
        return .noChoice
    }
}

func rpsGame(user: Player, opponent: Player) -> Bool {
    switch user.input {
    case .gameOver:
        return false
    case .rock, .scissor, .paper:
        let result: RpsGameResult = decideRpsGameResult(userInput: user.input, opponentInput: opponent.input)
        print(result)
        return result.isOver()
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return true
    }
}

func decideRpsGameResult(userInput: RockPaperScissor, opponentInput: RockPaperScissor) -> RpsGameResult {
    let gameInfo = (userInput, opponentInput)
    
    if userInput == opponentInput {
        return .draw
    } else if gameInfo == (.rock, .scissor) ||
              gameInfo == (.paper, .rock) ||
              gameInfo == (.scissor, .paper) {
        return .win
    } else {
        return .lose
    }
}

func makeRandomRockScissorPaperInput() -> RockPaperScissor {
    let randomInput = Int.random(in: 1...3)
    return convertInputToRockPaperScissor(randomInput)
}

while (run) {
    print(menuMessage, terminator: "")
    let cpuPlayer: Player = Player(input: makeRandomRockScissorPaperInput())
    let userPlayer: Player = Player(input: readInput())
    run = rpsGame(user: userPlayer, opponent: cpuPlayer)
}
print("게임 종료")
