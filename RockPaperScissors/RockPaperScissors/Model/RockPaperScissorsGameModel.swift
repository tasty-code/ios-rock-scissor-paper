//
//  RockPaperScissorsGameModel.swift
//  RockPaperScissors
//
//  Created by Minho on 11/28/23.
//

class RockPaperScissorsGameModel {
    /*
        이 모델은 가위바위보 게임과 관련된 로직을 정의하고,
        해당 게임의 데이터를 들고있도록 한다.
     */
    internal let _user: Player
    internal let _opponent: Player

    init(players: [Player]) {
        self._user = players[0]
        self._opponent = players[1]
    }
    
    func playGame() -> GameState {
        switch _user.input {
        case .rpsGameOver:
            return .gameOver
        case .rock, .scissor, .paper:
            let result: GameResult = decideGameResult()
            print(result)
            guard result != .draw else { return .rpsGame }
            initEachPlayersTurn(user: _user, opponent: _opponent, userGameResult: result)
            return .mjbGame
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return .rpsGame
        }
    }
    
    func decideGameResult() -> GameResult {
        let gameInfo = (_user.input, _opponent.input)
        
        if _user.input == _opponent.input {
            return .draw
        } else if gameInfo == (.rock, .scissor) ||
                  gameInfo == (.paper, .rock) ||
                  gameInfo == (.scissor, .paper) {
            return .win
        } else {
            return .lose
        }
    }
    
    func initEachPlayersTurn(user: Player, opponent: Player, userGameResult: GameResult) {
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
    
    // MARK: 다른 여타 함수처럼 매개변수를 빼던가(이미 클래스 내에 관련값들 있음), 관련값을 클래스에서 빼고 매개변수 받도록 변경
    func convertInputToRockPaperScissor(_ input: Int, _ gameState: GameState) -> RockPaperScissor{
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
}
