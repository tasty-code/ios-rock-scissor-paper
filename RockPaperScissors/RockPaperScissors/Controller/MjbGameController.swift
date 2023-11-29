//
//  MjbGameController.swift
//  RockPaperScissors
//
//  Created by Minho on 11/29/23.
//

class MjbGameController {
    private let mjbGame: MukJjiPpaGame
    
    init(mjbGame: MukJjiPpaGame) { // MARK: 외부에서 init을 여러 번 호출할 수도 있는 문제가 있음.
        self.mjbGame = mjbGame
    }
    
    func printMenuMessage() {
        let whosTurn: String = user.isMyTurn ? "사용자" : "컴퓨터"
        print("[\(whosTurn) 턴] \(mjbGame.menuMessage)", terminator: "")
    }
    
    func playGame(user: Player, opponent: Player) -> GameState {
        opponent.input = makeRandomRockScissorPaperInput()
        user.input = readInput() // MARK: 함수화 고려
        
        switch user.input {
        case .exitGame:
            print("게임 종료")
            return .endGame
        case .rock, .paper, .scissor:
            let gameResult: GameResult = mjbGame.decideGameResult(user: user, opponent: opponent)
            let winnerName: String = user.isMyTurn ? "사용자" : "컴퓨터"
            guard gameResult != .rematch else {
                print("\(winnerName)의 턴입니다.")
                return .mjbGame
            }
            print("\(winnerName)의 승리!")
            return .endGame
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            mjbGame.changeTurn(user: user, opponent: opponent, result: .rematch)
            return .mjbGame
        }
    }
    
    func readInput() -> RockPaperScissor {
        if let input = Int(readLine() ?? "") {
            return mjbGame.convertInput(input)
        } else {
            return .noChoice
        }
    }
    
    func makeRandomRockScissorPaperInput() -> RockPaperScissor { // MARK: 이름 변경 고려
        let randomInput = Int.random(in: 1...3)
        return mjbGame.convertInput(randomInput)
    }
}
