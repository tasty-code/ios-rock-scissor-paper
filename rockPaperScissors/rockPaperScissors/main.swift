import Foundation

func makeComputerValue() -> Int {
    return Int.random(in: 1...3)
}

func checkUserValue(_ userValue: Int?) -> Int? {
    switch userValue {
    case 0:
        return nil
    case 1, 2, 3:
        return userValue
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    return nil
}

func inputUserValue() -> Int? {
    let userValue = readLine() ?? "nil"
    var integerUserValue: Int? = 0
    
    if let value = Int(userValue) {
        integerUserValue = value
    }
    
    integerUserValue = checkUserValue(integerUserValue)
    
    return integerUserValue
}

func checkWinOrLose(_ userValue: Int?) {
    let computerValue = makeComputerValue()
    
    if userValue == 1 && computerValue == 3 || userValue == 2 && computerValue == 1 || userValue == 3 && computerValue == 2 {
        print("이겼습니다!")
    } else if userValue == computerValue {
        print("비겼습니다!")
    } else {
        print("졌습니다!")
    }
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    let userValue: Int? = inputUserValue()
    guard let _ = userValue else {
        return
    }
    
    checkWinOrLose(userValue)
}

startGame()
