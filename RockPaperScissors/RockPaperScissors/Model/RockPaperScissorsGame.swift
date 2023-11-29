//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by Minho on 11/28/23.
//

class RockPaperScissorsGame : Playable {
    internal let _user: Player
    internal let _opponent: Player

    init(user: Player, opponent: Player) {
        self._user = user
        self._opponent = opponent
    }
    
    func playGame() -> GameState {
        switch _user.input {
        case .exitGame:
            return .endGame
        case .rock, .scissor, .paper:
            let result: GameResult = decideGameResult()
            print(result)
            guard result != .draw else { return .rpsGame }
            // MARK: 턴을 설정하는것까진 좋지만, 유저가 턴을 들고있고 설정되는것보다
            // MARK: 여기서 enum Turn 을 반환하는 것도 나쁘진 않을 듯.
            _user.isMyTurn = result == .win ? true : false
            _opponent.isMyTurn = result == .lose ? true : false
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
    
    func convertInput(_ input: Int) -> RockPaperScissor{
        switch input {
        case 0:
            return .exitGame
        case 1:
            return .scissor
        case 2:
            return .rock
        case 3:
            return .paper
        default:
            return .noChoice
        }
    }
    
    func printMenuMessage() {
        print(MenuMessage.rps, terminator: "")
    }
}
