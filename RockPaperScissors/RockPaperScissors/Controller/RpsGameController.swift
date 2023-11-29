//
//  RpsGameController.swift
//  RockPaperScissors
//
//  Created by Minho on 11/29/23.
//

class RpsGameController {
    private let _user: Player
    private let _opponent: Player
    
    private let _rpsGame: RockPaperScissorsGame
    
    init(user: Player, opponent: Player, rpsGame: RockPaperScissorsGame) { // MARK: 외부에서 init을 여러 번 호출할 수도 있는 문제가 있음.
        self._user = user
        self._opponent = opponent
        self._rpsGame = rpsGame
    }
    
    func printMenuMessage(message: MenuMessage) {
        print(message, terminator: "")
    }
    
    func playGame() -> GameState {
        opponent.input = makeRandomRockScissorPaperInput()
        user.input = readInput() // MARK: 함수화 고려
        
        switch _user.input {
        case .exitGame:
            print("게임 종료")
            return .endGame
        case .rock, .paper, .scissor:
            let gameResult: GameResult = _rpsGame.decideGameResult()
            print(gameResult)
            guard gameResult != .draw else { return .rpsGame }
            initPlayersTurn(gameResult: gameResult)
            return .mjbGame
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return .rpsGame
        }
    }
    
    func initPlayersTurn(gameResult: GameResult) {
        switch gameResult {
        case .win:
            user.isMyTurn = true
        case .lose:
            opponent.isMyTurn = true
        default:
            user.isMyTurn = false
            opponent.isMyTurn = false
        }
    }
    
    func readInput() -> RockPaperScissor {
        if let input = Int(readLine() ?? "") {
            return _rpsGame.convertInput(input)
        } else {
            return .noChoice
        }
    }
    
    func makeRandomRockScissorPaperInput() -> RockPaperScissor {
        let randomInput = Int.random(in: 1...3)
        return _rpsGame.convertInput(randomInput)
    }
}
