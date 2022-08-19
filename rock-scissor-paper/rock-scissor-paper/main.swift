import Foundation

var isDone: Bool = false

func showMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func getMenuInput() -> Int {
    guard let userInput = readLine(), let input = Int(userInput) else {
        return 0
    }
    return input
}

func createRandomNumber() -> Int {
    enum Rockscissorpaper: Int {
        case scissor = 1, rock, paper
    }
    let computerRandomNumber = Int.random(in: Rockscissorpaper.scissor.rawValue...Rockscissorpaper.paper.rawValue)
    
    return computerRandomNumber
}

func analyzeUserInput(userNumber: Int) {
    let computerRandomNumber = createRandomNumber()
    let comparisonOfNumber = userNumber - computerRandomNumber
    
    switch comparisonOfNumber {
    case 0:
        print(computerRandomNumber)
        print("비겼습니다!\n")
    case 1 where (-2 != 0):
        print(computerRandomNumber)
        print("이겼습니다!\n")
        isDone = true
    case -1 where (2 != 0):
        print(computerRandomNumber)
        print("졌습니다!\n")
        isDone = true
    default:
        print("잘못된 입력입니다. 다시 시도해 주세요.\n")
        showMenu()
        analyzeUserInput(userNumber: getMenuInput())
    }
}

func startGame() {
    while !isDone {
        showMenu()
        analyzeUserInput(userNumber: getMenuInput())
    }
}

startGame()

