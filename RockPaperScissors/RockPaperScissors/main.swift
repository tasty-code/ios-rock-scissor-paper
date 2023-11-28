//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

var run: Bool = true
var menuMessage: MenuMessage = .rps
var gameState: GameState = .rpsGame

class Player {
    var input: RockPaperScissor
    var isMyTurn: Bool
    
    init(input: RockPaperScissor, isMyTurn: Bool = false) {
        self.input = input
        self.isMyTurn = isMyTurn
    }
}

enum RockPaperScissor: Int {
    case rpsGameOver = 0,
         scissor = 1,
         rock = 2,
         paper = 3,
         noChoice = 4
}

enum GameState: Int {
    case gameOver = 0,
         rpsGame = 1,
         mjbGame = 2
}

func convertInputToRockPaperScissor(_ input: Int, _ gameState: GameState) -> RockPaperScissor {
    switch input {
    case 0:
        return .rpsGameOver
    case 1:
        return gameState == .rpsGame ? .scissor : .rock
    case 2:
        return gameState == .rpsGame ? .rock : .scissor
    case 3:
        return .paper
    default:
        return .noChoice
    }
}

enum RpsGameResult: CustomStringConvertible {
    case win, draw, lose, rematch
    
    var description: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .draw:
            return "비겼습니다!"
        case .lose:
            return "졌습니다!"
        case .rematch:
            return "다시 고르세요"
        }
    }
}

enum MenuMessage: CustomStringConvertible {
    case rps, mjb
    
    var description: String {
        switch self {
        case .rps:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        case .mjb:
            return "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        }
    }
}

func readInput() -> RockPaperScissor {
    if let input = Int(readLine() ?? "") {
        return convertInputToRockPaperScissor(input, gameState)
    } else {
        return .noChoice
    }
}

func rpsGame(user: Player, opponent: Player) -> GameState {
    switch user.input {
    case .rpsGameOver:
        return .gameOver
    case .rock, .scissor, .paper:
        let result: RpsGameResult = decideRpsGameResult(userInput: user.input, opponentInput: opponent.input)
        print(result)
        guard result != .draw else { return .rpsGame }
        changeTurn(user: user, opponent: opponent, userGameResult: result)
        return .mjbGame
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return .rpsGame
    }
}

func mjbGame(user: Player, opponent: Player) -> GameState {
    switch user.input {
    case .rpsGameOver:
        return .gameOver
    case .rock, .scissor, .paper:
        let mjbResult: RpsGameResult = decideMjbGameResult(user: user, opponent: opponent)
        if mjbResult == RpsGameResult.win || mjbResult == RpsGameResult.lose {
            print(mjbResult)
            return .gameOver
        } else {
            return .mjbGame
//            print(mjbResult)
//            printMenuMessage(user: user, opponent: opponent)
//            user.input = readInput()
//            opponent.input = makeRandomRockScissorPaperInput()
        }
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return .mjbGame
    }
}
    
func changeTurn(user: Player, opponent: Player, userGameResult: RpsGameResult) {
    switch userGameResult {
    case .win:
        user.isMyTurn = true
        opponent.isMyTurn = false
    case .lose:
        user.isMyTurn = false
        opponent.isMyTurn = true
    default:
        print("error")
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

func decideMjbGameResult(user: Player, opponent: Player) -> RpsGameResult {
    if user.input == opponent.input {
        return user.isMyTurn ? .win : .lose
    } else {
        changeTurn(user: user, opponent: opponent, userGameResult: decideRpsGameResult(userInput: user.input, opponentInput: opponent.input))
        return .rematch
    }
}

func makeRandomRockScissorPaperInput() -> RockPaperScissor {
    let randomInput = Int.random(in: 1...3)
    return convertInputToRockPaperScissor(randomInput, gameState)
}

func printMenuMessage(user: Player, opponent: Player) {
    switch gameState {
    case .gameOver:
        print("게임 종료")
    case .rpsGame:
        print(MenuMessage.rps, terminator: "")
    case .mjbGame:
        let playerName: String = user.isMyTurn == true ? "사용자" : "컴퓨터"
        print("[\(playerName)의 턴] \(MenuMessage.mjb)", terminator: "")
    }
}

let cpuPlayer: Player = Player(input: .noChoice)
let userPlayer: Player = Player(input: .noChoice)

while gameState != .gameOver {
    printMenuMessage(user: userPlayer, opponent: cpuPlayer)
    cpuPlayer.input = makeRandomRockScissorPaperInput() // MARK: make라는 접두어 다른걸로 바꾸기. fatory method 혼동우려
    userPlayer.input = readInput()
    print("사용자의 선택 : \(userPlayer.input), 컴퓨터의 선택 : \(cpuPlayer.input)") // MARK: 나중에 지울 debug 문장
    switch gameState {
    case .gameOver:
        run = false
    case .rpsGame:
        gameState = rpsGame(user: userPlayer, opponent: cpuPlayer)
    case .mjbGame:
        gameState = mjbGame(user: userPlayer, opponent: cpuPlayer)
    }
}
