//
//  MukJjiPpaGame.swift
//  RockPaperScissors
//
//  Created by Minho on 11/28/23.
//

class MukJjiPpaGame : Playable {
    
    private var _rpsGame: RockPaperScissorsGame
    private let _user: Player
    private let _opponent: Player
    
    init(rpsGame: RockPaperScissorsGame) {
        self._rpsGame = rpsGame
        _user = _rpsGame._user
        _opponent = _rpsGame._opponent
    }
    
    func playGame() -> GameState {
        switch _user.input {
        case .exitGame:
            return .endGame
        case .rock, .scissor, .paper:
            let mjbResult: GameResult = decideGameResult()
            let winnerName: String = _user.isMyTurn ? "사용자" : "컴퓨터"
            guard mjbResult != .rematch else {
                print("\(winnerName)의 턴입니다.")
                return .mjbGame
            }
            print("\(winnerName)의 승리!")
            return .endGame
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            _user.isMyTurn = false // MARK: 반복되는 부분이므로 함수화 할 수 있으면 함수화
            _opponent.isMyTurn = true
            return .mjbGame
        }
    }
    
    func decideGameResult() -> GameResult {
        if _user.input == _opponent.input {
            return _user.isMyTurn ? .win : .lose
        } else {
            let result: GameResult = _rpsGame.decideGameResult()
            _user.isMyTurn = result == .win ? true : false
            _opponent.isMyTurn = result == .lose ? true : false
            return .rematch
        }
    }
    
    func convertInput(_ input: Int) -> RockPaperScissor{
        switch input {
        case 0:
            return .exitGame
        case 1:
            return .rock
        case 2:
            return .scissor
        case 3:
            return .paper
        default:
            return .noChoice
        }
    }
    
    func printMenuMessage() {
        let playerName: String = _user.isMyTurn == true ? "사용자" : "컴퓨터"
        print("[\(playerName)의 턴] \(MenuMessage.mjb)", terminator: "")
    }
}
