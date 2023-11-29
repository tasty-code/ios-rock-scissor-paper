
import Foundation

enum UserMenuOption: String {
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
    case error = "잘못된 입력입니다. 다시 시도해주세요."
}

func handleUserInput(computerPick: UserMenuOption, userChoice: UserMenuOption) {
    switch userChoice {
    case .exit:
        gameOver()
    case .paper, .rock, .scissor:
        handelGameResult(computerPick: computerPick, userPick: userChoice)
    }
}

func getGameResult(computerPick: UserMenuOption, userPick: UserMenuOption) -> GameMenuPrompt {
    if computerPick == userPick {
        return .draw
    }
    switch (computerPick, userPick) {
    case (.scissor, .rock), (.rock, .paper), (.paper, .scissor):
        return .win
    default:
        return .lose
    }
}

func displayPromptMenu(for situation: GameMenuPrompt) {
    switch situation {
    case .menu:
        print(situation.rawValue, terminator: "")
    default:
        print(situation.rawValue)
    }
}

func handelGameResult(computerPick: UserMenuOption, userPick: UserMenuOption) {
    let result: GameMenuPrompt = getGameResult(computerPick: computerPick, userPick: userPick)
    
    displayPromptMenu(for: result)
    
    if result == .draw {
        return
    }

    gameOver()
}

func gameOver() {
    displayPromptMenu(for: .exit)
    isGameRunning.toggle()
}

var isGameRunning: Bool = true
let computerOptions: [String] = ["1", "2", "3"]
let playerInputOptions: [String] = ["0", "1", "2", "3"]

while isGameRunning {
    displayPromptMenu(for: .menu)
    guard let randomComputerPick = computerOptions.randomElement(), let computerPick = UserMenuOption(rawValue: randomComputerPick) else {
        continue
    }
    
    guard let input = readLine(), let userChoice = UserMenuOption(rawValue: input), playerInputOptions.contains(userChoice.rawValue) else {
        displayPromptMenu(for: .error)
        continue
    }
    
    handleUserInput (computerPick: computerPick, userChoice: userChoice)
}



