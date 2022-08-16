import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    let userNumber: Int = getUserNumber()
    
    if isValidNumber(userNumber: userNumber) == false {
        return
    }
    
    let computerNumber: Int = Int.random(in: 1...3)
    judgeNumber(computerNumber: computerNumber, userNumber: userNumber)
}

func getUserNumber() -> Int {
    let userNumber: Int = Int(readLine() ?? "") ?? -1
    return userNumber
}

func isValidNumber(userNumber: Int) -> Bool {
    switch userNumber {
    case 0:
        print("게임 종료")
        return false
    case 1...3:
        break
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        printMenu()
    }
    
    return true
}

func judgeNumber(computerNumber: Int, userNumber: Int) -> Void {
    if (computerNumber == 1 && userNumber == 3) || userNumber < computerNumber {
        print("졌습니다!")
    } else if computerNumber == userNumber {
        print("비겼습니다!")
    } else {
        print("이겼습니다!")
    }
}

printMenu()
