import Foundation

var isDone: Bool = false

func showMenu() {
     print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func getMenuInput() -> Int {
    guard let userInput = readLine(), let input = Int(userInput) else {
        return Int()
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
    
    if userNumber == computerRandomNumber {
        print("비겼습니다!\n")
    } else if computerRandomNumber + 1 == userNumber || computerRandomNumber == 3 && userNumber == 1 {
        print("이겼습니다!\n")
        isDone = true
    } else if userNumber == 0 {
        isDone = true
    } else if computerRandomNumber - 1 == userNumber || computerRandomNumber == 1 && userNumber == 3 {
        print("졌습니다!\n")
        isDone = true
    } else {
        print("잘못된 입력입니다. 다시 시도해 주세요.\n")
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

