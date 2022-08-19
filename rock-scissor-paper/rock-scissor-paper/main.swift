import Foundation

var isDone: Bool = false

enum RockScissorPaper: Int {
    case scissor = 1, rock, paper
}

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
    let computerRandomNumber = Int.random(in: RockScissorPaper.scissor.rawValue...RockScissorPaper.paper.rawValue)

    return computerRandomNumber
}

func analyzeUserInput(userNumber: Int) {
    let computerRandomNumber = createRandomNumber()
    let comparisonOfNumber = (userNumber, computerRandomNumber)
    
    switch comparisonOfNumber {
    case (0, _):
        isDone = true
    case (1, 1):
        print("비겼습니다!\n")
    case (1, 3):
        print("이겼습니다!\n")
        isDone = true
    case (1, 2):
        print("졌습니다!\n")
        isDone = true
    case (2, 2):
        print("비겼습니다!\n")
    case (2, 1):
        print("이겼습니다!\n")
        isDone = true
    case (2, 3):
        print("졌습니다!\n")
        isDone = true
    case (3, 3):
        print("비겼습니다!\n")
    case (3, 2):
        print("이겼습니다!\n")
        isDone = true
    case (3, 1):
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

