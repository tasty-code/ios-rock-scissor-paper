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
    case (RockScissorPaper.scissor.rawValue, RockScissorPaper.scissor.rawValue):
        print("비겼습니다!\n")
    case (RockScissorPaper.scissor.rawValue, RockScissorPaper.paper.rawValue):
        print("이겼습니다!\n")
        isDone = true
    case (RockScissorPaper.scissor.rawValue, RockScissorPaper.rock.rawValue):
        print("졌습니다!\n")
        isDone = true
    case (RockScissorPaper.rock.rawValue, RockScissorPaper.rock.rawValue):
        print("비겼습니다!\n")
    case (RockScissorPaper.rock.rawValue, RockScissorPaper.scissor.rawValue):
        print("이겼습니다!\n")
        isDone = true
    case (RockScissorPaper.rock.rawValue, RockScissorPaper.paper.rawValue):
        print("졌습니다!\n")
        isDone = true
    case (RockScissorPaper.paper.rawValue, RockScissorPaper.paper.rawValue):
        print("비겼습니다!\n")
    case (RockScissorPaper.paper.rawValue, RockScissorPaper.paper.rawValue):
        print("이겼습니다!\n")
        isDone = true
    case (RockScissorPaper.paper.rawValue, RockScissorPaper.scissor.rawValue):
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

