import Foundation

//MARK: - GameRules init & deinit
final class GameRules {
    
    private let computerPlayer = ComputerPlayer()
    private let rpsLinkedList = CircularRpsLinkedList()
    var onRequstSecondGame: ((GameResult) -> Void)?
    var onSecondGameResult: ((Bool, RPSModel?, RPSModel?) -> Void)?
    var onUpdateMessage: ((String) -> Void)?
    var onReStartGame: (() -> Void)?
    deinit { print("GameRules Deinit!!") }
}

//MARK: - GameRules method
extension GameRules {
    func playGameWithUserInput( input: String) {
        
        guard let userChoice = convertInputToRPSOption(input)
        else { onUpdateMessage? (GameResult.error.message); return }
        
        let gameResult = determineFirstGameWinner(userChoice: userChoice)
    }
    func playSecondGameWithUserInput( input: String) {
        guard let userChoice = convertInputToRPSOption(input)
        else { onUpdateMessage? (GameResult.endGame.message); return }
        let secoundGamsResult = determineSecondGameWinner(userChoice: userChoice)
    }
    
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
    
    private func determineFirstGameWinner(userChoice: RPSModel) -> GameResult {
        let computerChoice = computerPlayer.makeRandomChoice()
        onUpdateMessage?("유저 선택:::\(userChoice), 컴퓨터 선택:::\(computerChoice)")
        
        guard let computerNode = rpsLinkedList.node(for: computerChoice)
        else { return .error}
        
        if computerNode.next?.value == userChoice {
            onUpdateMessage?(GameResult.win.message)
            onRequstSecondGame?(GameResult.win)
            return .win
        } else if computerNode.value == userChoice {
            onUpdateMessage?(GameResult.draw.message)
            onReStartGame?()
            return .draw
        } else {
            onUpdateMessage?(GameResult.loss.message)
            onRequstSecondGame?(GameResult.loss)
            
            return .loss
        }
    }
    
    //두번째 게임(묵찌빠)규칙 로직
    private func determineSecondGameWinner(userChoice: RPSModel)  {
        let computerChoice = computerPlayer.makeRandomChoice()
        if userChoice == computerChoice {
            onSecondGameResult?(true, userChoice, computerChoice)
        } else {
            onSecondGameResult?(false, userChoice, computerChoice)
        }
    }
}
