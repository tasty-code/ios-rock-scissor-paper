
import Foundation

//MARK: - GameRules init & deinit
final class GameRules {
    private let computerPlayer = ComputerPlayer()
    private let rpsLinkedList = CircularRpsLinkedList()
    var onRequstSecondGame: (() -> Void)?
    var onUpdateMessage: ((String) -> Void)?
    var onRestartFirstGame: (() -> Void)?
    var onRestartSecondGame: (() -> Void)?
    var gameTurn: TurnModel?
    
    deinit { print("GameRules Deinit!!") }
}

//MARK: - Common GameRules method
extension GameRules {
    func convertInputToRPSOption(_ input: String) -> RPSModel? {
        switch Int(input) {
        case RPSModel.scissors.rawValue:
            return .scissors
        case RPSModel.rock.rawValue:
            return .rock
        case RPSModel.paper.rawValue:
            return .paper
        default:
            return nil
        }
    }
}

//MARK: - First GameRules method (가위바위보)
extension GameRules {
    func playFirstGameWithUserInput( input: String) {
        switch input {
        case "0":
            onUpdateMessage?(GameResult.endGame.message)
        case "1","2","3":
            guard let userChoice = convertInputToRPSOption(input)
            else { onUpdateMessage? (GameResult.error.message); return }
            
            let gameResult = determineFirstGameWinner(userChoice: userChoice)
        default:
            onUpdateMessage?(GameResult.error.message)
            onRestartFirstGame?()
        }
    }

    private func determineFirstGameWinner(userChoice: RPSModel) {
        let computerChoice = computerPlayer.makeRandomChoice()
        
        onUpdateMessage?("유저 선택:::\(userChoice), 컴퓨터 선택:::\(computerChoice)")
        
        guard let computerNode = rpsLinkedList.node(for: computerChoice)
        else { return }
        
        if computerNode.next?.value == userChoice {
            onUpdateMessage?(GameResult.win.message)
            gameTurn = .userTurn
            onRequstSecondGame?()
        } else if computerNode.value == userChoice {
            onUpdateMessage?(GameResult.draw.message)
            onRestartFirstGame?()
        } else {
            onUpdateMessage?(GameResult.loss.message)
            gameTurn = .computerTurn
            onRequstSecondGame?()
        }
    }
}


//MARK: - Second GameRules method (묵찌빠)
extension GameRules {
    func playSecondGameWithUserInput( input: String) {
        
        switch input {
        case "0":
            onUpdateMessage?(GameResult.endGame.message)
        case "1","2","3":
            guard let userChoice = convertInputToRPSOption(input)
            else { onUpdateMessage? (GameResult.error.message); return }
            
            let secoundGamsResult = determineSecondGameWinner(userChoice: userChoice)
        default:
            onUpdateMessage?(GameResult.error.message)
            gameTurn = .computerTurn
            onUpdateMessage?(TurnModel.computerTurn.message)
            onRestartSecondGame?()
            
        }
    }
    
    func dipslaySecondGameComment() {
        switch gameTurn {
        case .userTurn:
            onUpdateMessage? (TurnModel.userTurn.message)
        case .computerTurn:
            onUpdateMessage? (TurnModel.computerTurn.message)
        default:
            break
        }
    }
    
    private func determineSecondGameWinner(userChoice: RPSModel)  {
        let computerChoice = computerPlayer.makeRandomChoice()
        
        if gameTurn == .userTurn && computerChoice == userChoice {
            onUpdateMessage?("사용자 승")
        } else if gameTurn == .userTurn && computerChoice != userChoice {
            onUpdateMessage?("컴퓨터 턴입니다.")
            onUpdateMessage?(TurnModel.computerTurn.message)
            if gameTurn == .userTurn {
                gameTurn = .computerTurn
                onRestartSecondGame?()
            } else {
                gameTurn = .computerTurn
                return
            }
        } else if gameTurn == .computerTurn && computerChoice == userChoice {
            onUpdateMessage?("컴퓨터 승")
        } else {
            onUpdateMessage?("사용자 턴입니다.")
            onUpdateMessage?(TurnModel.userTurn.message)
            if gameTurn == .computerTurn {
                gameTurn = .userTurn
                onRestartSecondGame?()
            } else {
                gameTurn = .userTurn
                return
            }
        }
    }
}
