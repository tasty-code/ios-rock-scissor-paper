import Foundation

enum UserInput: String {
    case scissor = "1"
    case rock = "2"
    case paper = "3"
    case exit = "0"
}

enum GameMenuPrompt: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료: 0> : "
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    case exit = "게임 종료"
    case mukChiPPaMenu = "묵(1), 찌(2), 빠(3)! <종료: 0> : "
    case error = "잘못된 입력입니다. 다시 시도해주세요."
}

enum MukChiPPaOption: String {
    case muk = "1"
    case chi = "2"
    case ppa = "3"
    case exit = "게임종료"
}

var isGameRunning: Bool = true

func processUserInput(comPick: UserInput, userPick: UserInput) {
    switch userPick {
    case .exit:
        endGame()
    case .scissor, .rock, .paper:
        let result: GameMenuPrompt = determineGameResult(comPick: comPick, userPick: userPick)
        showGameMenu(for: result)
        
        if result == .draw {
            return
        } else {
            let userWon = result == .win ? true : false
            if userWon {
                print("[사용자 턴] ", terminator: "")
                playMukChiPPa(turn: .user)
            } else {
                print("[컴퓨터 턴] ", terminator: "")
                playMukChiPPa(turn: .computer)
            }
        }
    }
}

func determineGameResult(comPick: UserInput, userPick: UserInput) -> GameMenuPrompt {
    if comPick == userPick {
        return .draw
    }
    
    switch (comPick, userPick) {
    case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
        return .win
    default:
        return .lose
    }
}

func showGameMenu(for situation: GameMenuPrompt) {
    switch situation {
    case .menu, .mukChiPPaMenu, .exit:
        print(situation.rawValue, terminator: "")
    case .error:
        print(situation.rawValue)
    default:
        print(situation.rawValue)
    }
}

func endGame() {
    showGameMenu(for: .exit)
    isGameRunning = false
}

enum mukchippaGamreTurn {
    case user
    case computer
    
    mutating func toggle() {
        switch self {
        case .user:
            self = .computer
        case .computer:
            self = .user
        }
    }
}

func playMukChiPPa(turn: mukchippaGamreTurn) {
    var currentTurn = turn
    
    while true {
        showGameMenu(for: .mukChiPPaMenu)
        
        guard let input = readLine(), let userMukChiPPa = MukChiPPaOption(rawValue: input) else {
            showGameMenu(for: .error)
            continue
        }
        
        if userMukChiPPa == .exit {
            print("게임 종료")
            endGame()
            break
        }
        
        let comMukChiPPa = MukChiPPaOption(rawValue: String(Int.random(in: 1...3)))!
        
        if userMukChiPPa == comMukChiPPa {
            if currentTurn == .user {
                print("사용자의 승리!")
            } else {
                print("컴퓨터의 승리!")
            }
            endGame()
            break
        } else {
            currentTurn.toggle()
            print(currentTurn == .user ? "[사용자 턴]" : "[컴퓨터 턴]" ,terminator: "" )
        }
    }
}
while isGameRunning {
    showGameMenu(for: .menu)
    
    guard let randomComChoice = UserInput(rawValue: String(Int.random(in: 1...3))) else {
        continue
    }
    
    guard let input = readLine(), let userPick = UserInput(rawValue: input) else {
        showGameMenu(for: .error)
        continue
    }
    
    let result = determineGameResult(comPick: randomComChoice, userPick: userPick)
    processUserInput(comPick: randomComChoice, userPick: userPick)
}


