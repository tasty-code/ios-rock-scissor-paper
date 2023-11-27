
import Foundation

enum ChoiceMenu: String {
    case scissor = "1" , rock = "2", paper = "3", exit = "0"
    case other
}

enum Result: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

func startMessage() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func action(com: ChoiceMenu, user: ChoiceMenu) {
    switch user {
    case .exit:
        endGame()
    case .paper, .rock, .scissor:
        startGame(comPick: com, userPick: user)
    case .other:
        print("잘못된 입력입니다. 다ls시 시도해주세요.")
    }
}

func startGame(comPick: ChoiceMenu, userPick: ChoiceMenu) {
    if comPick == userPick {
        print(Result.draw.rawValue)
        return
    } else if (comPick == .scissor && userPick == .rock) ||
                (comPick == .rock && userPick == .paper) ||
                (comPick == .paper && userPick == .scissor)
    {
        print(Result.win.rawValue)
    } else {
        print(Result.lose.rawValue)
    }
    
    endGame()
}

func endGame() {
    print("게임 종료")
    isWorking.toggle()
}

var isWorking: Bool = true
let rps: [String] = ["1", "2", "3"]

while isWorking {
    startMessage()
    let comChoice: String = rps.randomElement() ?? ""
    
    if let userChoice = readLine() {
        action(com: ChoiceMenu(rawValue: comChoice) ?? .scissor, user: ChoiceMenu(rawValue: userChoice) ?? .other)
    }
}


