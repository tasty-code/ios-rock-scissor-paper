import Foundation

enum PrintingHandler {
    private enum Message: CustomStringConvertible {
        case rockPaperScissorsOptions
        case gameOver
        case invalidOption
        case mukJjiPpaOptions(PlayerTurn)
        case winner(PlayerTurn)
        case playerTurn(PlayerTurn)
        
        var description: String {
            switch self {
            case .rockPaperScissorsOptions:
                return "가위(1), 바위(2), 보(3)! <종료: 0> : "
            case .gameOver:
                return "게임 종료"
            case .invalidOption:
                return "잘못된 입력입니다. 다시 시도해 주세요."
            case .mukJjiPpaOptions(let playerTurn):
                return "[\(playerTurn) 턴]묵(1), 찌(2), 빠(3)! <종료 : 0> : "
            case .playerTurn(let playerTurn):
                return "\(playerTurn)의 턴입니다."
            case .winner(let winner):
                return "\(winner)의 승리!"
            }
        }
    }
    
    static func showRockPaperScissorsOptions() {
        print(Message.rockPaperScissorsOptions, terminator: "")
    }
    static func showMukJjiPpaOptions(playTurn: PlayerTurn) {
        print(Message.mukJjiPpaOptions(playTurn), terminator: "")
    }
    
    static func notifyGameOver() {
        print(Message.gameOver)
    }
    
    static func notifyInvalidOption() {
        print(Message.invalidOption)
    }
    
    static func notifyOutcome(of gameOutcome: GameOutcome) {
        print(gameOutcome)
    }
    
    static func notifyWinner(winner: PlayerTurn) {
        print(Message.winner(winner))
    }
    
    static func notifyPlayerTurn(playTurn: PlayerTurn){
        print(Message.playerTurn(playTurn))
    }
        
}
