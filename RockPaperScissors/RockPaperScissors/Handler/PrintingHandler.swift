import Foundation

enum PrintingHandler {
    private enum Message: CustomStringConvertible {
        case options
        case gameOver
        case invalidOption
        
        var description: String {
            switch self {
            case .options:
                return "가위(1), 바위(2), 보(3)! <종료: 0> : "
            case .gameOver:
                return "게임 종료"
            case .invalidOption:
                return "잘못된 입력입니다. 다시 시도해 주세요."
            }
        }
    }
    
    static func showOptions() {
        print(Message.options, terminator: "")
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
}
