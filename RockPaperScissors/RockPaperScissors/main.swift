
import Foundation

enum UserInput: String {
    case scissor = "1"
    case rock = "2"
    case paper = "3"
    case exit = "0"
}

enum gameMenuPrompt: String {
    case rockScissorPaperGameMenu = "가위(1), 바위(2), 보(3)! <종료: 0> : "
    case mukcchippaGameMenu = "묵(1), 찌(2), 빠(3)! <종료 : 0> :"
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    case exit = "게임 종료"
    case error = "잘못된 입력입니다. 다시 시도해주세요."
}

func processUserInput(comPick: UserInput, userPick: UserInput) {
    switch userPick {
    case .exit:
        gameOver()
    case .paper, .rock, .scissor:
        //가위바위보 case에서 묵찌빠 게임 구현
        let result: gameMenuPrompt = returnResult(comPick: comPick, userPick: userPick)
        displayGameMenu(for: result)
        
        switch result {
        case .win, .lose, .draw:
            gameOver()
            //묵찌빠 실행 메서드 호출
        default:
            break
        }
    }
}

func returnResult(comPick: UserInput, userPick: UserInput) -> gameMenuPrompt {
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

func displayGameMenu(for situation: gameMenuPrompt) {
    switch situation {
    case .rockScissorPaperGameMenu:
        print(situation.rawValue, terminator: "")
    default:
        print(situation.rawValue)
    }
}

func printGameResult(comPick: UserInput, userPick:UserInput) {
    let result: gameMenuPrompt = returnResult(comPick: comPick, userPick: userPick)
    displayGameMenu(for: result)
}


func gameOver() {
    displayGameMenu(for: .exit)
    isGameWorking.toggle()
}

var isGameWorking: Bool = true
let computerChoice: [String] = ["1", "2", "3"]
let playerChoices: [String] = ["0", "1", "2", "3"]

while isGameWorking {
    displayGameMenu(for: .rockScissorPaperGameMenu)
    guard let randomComChoice = computerChoice.randomElement(), let comPick = UserInput(rawValue: randomComChoice) else { continue }
    
    guard let input = readLine(), let userPick = UserInput(rawValue: input), playerChoices.contains(userPick.rawValue) else {
        displayGameMenu(for: .error)
        continue
    }
    
    processUserInput(comPick: comPick, userPick: userPick)
}








