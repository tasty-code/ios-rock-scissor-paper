import Foundation

enum PrintingHandler {
    private enum Message: CustomStringConvertible {
        case rpsOptions
        case mjpOptions(PlayerTurn), playerTurn(PlayerTurn), winner(PlayerTurn)
        case invalidOption
        case gameOver
        
        var description: String {
            switch self {
            case .rpsOptions:
                return "가위(1), 바위(2), 보(3)! <종료: 0> : "
            case .mjpOptions(let player):
                return "[\(player) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
            case .playerTurn(let player):
                return "\(player)의 턴입니다."
            case .winner(let player):
                return "\(player)의 승리!"
            case .invalidOption:
                return "잘못된 입력입니다. 다시 시도해 주세요."
            case .gameOver:
                return "게임 종료"

            }
        }
    }
    
    static func showRPSOptions() {
        print(Message.rpsOptions, terminator: "")
    }
    
    static func showMJPOptions(for player: PlayerTurn) {
        print(Message.mjpOptions(player), terminator: "")
    }
    
    static func notifyRPSOutcome(of rpsOutcome: RPSOutcome) {
        print(rpsOutcome)
    }
    
    static func notifyMJPTurn(of player: PlayerTurn){
        print(Message.playerTurn(player))
    }
    
    static func notifyMJPWinner(of player: PlayerTurn) {
        print(Message.winner(player))
    }

    static func notifyInvalidOption() {
        print(Message.invalidOption)
    }
    
    static func notifyExitByPlayer() {
        print(Message.gameOver)
    }
}
