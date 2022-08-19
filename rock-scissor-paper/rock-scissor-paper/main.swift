import Foundation

let cardNumbersRange = 1...3
func startGame() {
    printMenu()
    let computerNumber: Int = makeComputerNumber()
    let userNumber: Int = manageUserNumber()
    if isValidNumber(userNumber: userNumber) == false {
        return
    }
    judgeNumber(computerNumber: computerNumber, userNumber: userNumber)
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
   }

func makeComputerNumber() -> Int {
    let computerNumber: Int = Int.random(in: cardNumbersRange)
    return computerNumber
}

func manageUserNumber() -> Int {
    let userNumber: Int = getUserNumber()
    return userNumber
}

func getUserNumber() -> Int {
    if let input = readLine(), let userNumber = Int(input) {
        return userNumber
    }
    
    return -1
}

func isValidNumber(userNumber: Int) -> Bool {
    var isValidBool: Bool = true
    switch userNumber {
    case 0:
        isValidBool = false
    case cardNumbersRange:
        break
    default:
        invalidInputHandling()
        isValidBool = false
    }
    
    return isValidBool
}

func invalidInputHandling() {
    print("잘못된 입력입니다. 다시 시도해주세요.\n")
    startGame()
}

func judgeNumber(computerNumber: Int, userNumber: Int) -> Void {
    let computerAndUserNumber: [Int: Int] = [computerNumber: userNumber]
    
    switch computerAndUserNumber {
    case [1: 2], [2: 3], [3: 1]:
        print("이겼습니다!\n")
    case [1: 3], [2: 1], [3: 2]:
        print("졌습니다!\n")
    default:
        print("비겼습니다!\n")
    }
    
    startGame()
}

startGame()
