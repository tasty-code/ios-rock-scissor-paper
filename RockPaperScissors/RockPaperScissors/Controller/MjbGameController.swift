//
//  MjbGameController.swift
//  RockPaperScissors
//
//  Created by Minho on 11/29/23.
//

class MjbGameController {
    private let _user: Player
    private let _opponent: Player
    
    private let _mjbGame: MukJjiPpaGame
    
    init(user: Player, opponent: Player, mjbGame: MukJjiPpaGame) { // MARK: 외부에서 init을 여러 번 호출할 수도 있는 문제가 있음.
        self._user = user
        self._opponent = opponent
        self._mjbGame = mjbGame
    }
    
    func printMenuMessage(message: MenuMessage) {
        let whosTurn: String = _user.isMyTurn ? "사용자" : "컴퓨터"
        print("[\(whosTurn) 턴] \(message)", terminator: "")
    }
    
    func playGame() -> GameState {
        opponent.input = makeRandomRockScissorPaperInput()
        user.input = readInput() // MARK: 함수화 고려
        
        switch _user.input {
        case .exitGame:
            print("게임 종료")
            return .endGame
        case .rock, .paper, .scissor:
            let gameResult: GameResult = _mjbGame.decideGameResult()
            let winnerName: String = _user.isMyTurn ? "사용자" : "컴퓨터"
            guard gameResult != .rematch else {
                print("\(winnerName)의 턴입니다.")
                return .mjbGame
            }
            print("\(winnerName)의 승리!")
            return .endGame
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            user.isMyTurn = false
            opponent.isMyTurn = true // MARK: turn을 일일히 각자에게 알려줄 것인지 다른 곳에서 들고있을 것인지 생각
            return .mjbGame
        }
    }
    
    func readInput() -> RockPaperScissor {
        if let input = Int(readLine() ?? "") {
            return _mjbGame.convertInput(input)
        } else {
            return .noChoice
        }
    }
    
    func makeRandomRockScissorPaperInput() -> RockPaperScissor {
        let randomInput = Int.random(in: 1...3)
        return _mjbGame.convertInput(randomInput)
    }
}
