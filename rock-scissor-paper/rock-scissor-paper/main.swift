import Foundation

let cardNumbersRange = 1...3
func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    let userNumber: Int = getUserNumber()
    
    if isValidNumber(userNumber: userNumber) == false {
        return
    }
    
    let computerNumber: Int = Int.random(in: cardNumbersRange)
    judgeNumber(computerNumber: computerNumber, userNumber: userNumber)
    printMenu()
}

func getUserNumber() -> Int {
    if let input = readLine(), let userNumber = Int(input) {
        return userNumber
    }
    
    return -1
}

func isValidNumber(userNumber: Int) -> Bool {
    switch userNumber {
    case 0:
        return false
    case cardNumbersRange:
        break
    default:
        invalidInputHandling()
        return false
    }
    
    return true
}

func invalidInputHandling() {
    print("잘못된 입력입니다. 다시 시도해주세요.\n")
    printMenu()
}

func judgeNumber(computerNumber: Int, userNumber: Int) -> Void {
    if (computerNumber == 1 && userNumber == 3) || userNumber < computerNumber {
        print("졌습니다!\n")
    } else if computerNumber == userNumber {
        print("비겼습니다!\n")
    } else {
        print("이겼습니다!\n")
    }
}

printMenu()
