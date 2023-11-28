//
//  MukJjiPpaGameModel.swift
//  RockPaperScissors
//
//  Created by Minho on 11/28/23.
//

class MukJjiPpaGameModel {
    
    private var _rpsGame: RockPaperScissorsGameModel
    private var _user: Player
    private var _opponent: Player
    
    init(rpsGame: RockPaperScissorsGameModel) {
        self._rpsGame = rpsGame
        _user = _rpsGame._user
        _opponent = _rpsGame._opponent
    }
    
    func playGame() -> GameState {
        switch _user.input {
        case .rpsGameOver:
            return .gameOver
        case .rock, .scissor, .paper:
            let mjbResult: GameResult = decideGameResult()
            let winnerName: String = _user.isMyTurn ? "사용자" : "컴퓨터"
            guard mjbResult != .rematch else {
                print("\(winnerName)의 턴입니다")
                return .mjbGame
            }
            print("\(winnerName)의 승리!")
            return .gameOver
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
}
