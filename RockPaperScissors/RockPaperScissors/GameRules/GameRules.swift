



import Foundation

//MARK: - GameRules init & deinit
class GameRules {
    
    var result: String?
    let computerPlayer = ComputerPlayer()
    let rpsLinkedList = CircularRpsLinkedList()
    
    deinit { print("GameRules Deinit!!") }
}


//MARK: - GameRules method
extension GameRules {
    
    func convertInputToRPSOption(_ input: String) -> RPSModel? {
        switch input {
        case "1", "가위":
            return .scissors
        case "2", "바위":
            return .rock
        case "3", "보":
            return .paper
        default:
            return nil
        }
    }


    func playGameWithUserInput(_ input: String) -> (result: String, userChoice: RPSModel?, computerChoice: RPSModel?) {
        
        guard let userChoice = convertInputToRPSOption(input)
        else { return ("잘못된 입력", nil, nil) }
        
        let gameResult = determineWinner(userChoice: userChoice)
        return (gameResult, userChoice, computerPlayer.choice)
    }

    func determineWinner(userChoice: RPSModel) -> String {
        
        let computerChoice = computerPlayer.makeRandomChoice()
        
        guard let computerNode = rpsLinkedList.node(for: computerChoice) 
        else { return "컴퓨터 에러!"}
        
        if computerNode.next?.value == userChoice   { return "승리" }
        else if computerNode.value == userChoice    { return "무승부" }
        else                                        { return "패배" }
    }
}
