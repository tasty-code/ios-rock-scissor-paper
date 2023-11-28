
import Foundation

//MARK: - GameRules init & deinit
final class GameRules {
    private var result: String?
    private let computerPlayer = ComputerPlayer()
    private let rpsLinkedList = CircularRpsLinkedList()
    var onRequstSecondGame: ((GameResult) -> Void)?
    var onRPSResult: ((GameResult, RPSModel?, RPSModel?) -> Void)?
    
    deinit { print("GameRules Deinit!!") }
}


//MARK: - GameRules method
extension GameRules {
    func playGameWithUserInput(_ input: String) {
        
        guard let userChoice = convertInputToRPSOption(input)
        else { onRPSResult? (.error, nil, nil); return }
        
        let gameResult = determineFirstGameWinner(userChoice: userChoice)
        onRPSResult?(gameResult, userChoice, computerPlayer.choice)
    }
    
    private func convertInputToRPSOption(_ input: String) -> RPSModel? {
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
    
    private func determineFirstGameWinner(userChoice: RPSModel) -> GameResult {
        let computerChoice = computerPlayer.makeRandomChoice()
        guard let computerNode = rpsLinkedList.node(for: computerChoice) 
        else { return .error}
        
        if computerNode.next?.value == userChoice {
            onRequstSecondGame?(GameResult.win)
            return .win
        } else if computerNode.value == userChoice {
            return .draw
        } else {
            onRequstSecondGame?(GameResult.loss)
            return .loss
        }
    }
    
    //두번째 게임(묵찌빠)규칙 로직
    private func determineSecondGameWinner(userChoice: RPSModel) {
        
    }
}
