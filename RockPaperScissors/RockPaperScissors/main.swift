import Foundation

var isGameRunning: Bool = true

func handleUserInput(comPick: UserMenuOption, userPick: UserMenuOption) {
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
                print("[사용자 턴]", terminator: "")
                playMukChiPPa(turn: .user)
            } else {
                print("[컴퓨터 턴]", terminator: "")
                // 사용자 입력이 유효하지 않은 경우, 컴퓨터에게 턴을 넘김
                playMukChiPPa(turn: .computer)
            }
        }
    }
}


func determineGameResult(comPick: UserMenuOption, userPick: UserMenuOption) -> GameMenuPrompt {
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

func playMukChiPPa(turn: mukchippaGamreTurn) {
    var currentTurn = turn
    
    while true {
        showGameMenu(for: .mukChiPPaMenu)
        
        guard let input = readLine(), let userMukChiPPa = MukChiPPaOption(rawValue: input) else {
            showGameMenu(for: .error)
            print("[컴퓨터턴]", terminator: "")
            playMukChiPPa(turn: .computer)
            continue
        }
        
        if userMukChiPPa == .exit {
            print("게임 종료")
            endGame()
            break
        }
        
//        let comMukChiPPa = MukChiPPaOption(rawValue: String(Int.random(in: 1...3)))!
        guard let comMukChiPPa = MukChiPPaOption(rawValue: String(Int.random(in: 1...3))) else {
            continue
        }
        
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
            if currentTurn == .user {
                print("사용자의 턴입니다.")
            } else {
                print("컴퓨터의 턴입니다.")
            }
            print(currentTurn == .user ? "[사용자 턴]" : "[컴퓨터 턴]" ,terminator: "" )
        }
    }
}
while isGameRunning {
    showGameMenu(for: .menu)
    
    guard let randomComChoice = UserMenuOption.allCases.randomElement() else { continue }
    
    guard let input = readLine(), let userPick = UserMenuOption(rawValue: input) else {
        showGameMenu(for: .error)
        continue
    }
    
    let result = determineGameResult(comPick: randomComChoice, userPick: userPick)
    handleUserInput(comPick: randomComChoice, userPick: userPick)
}





