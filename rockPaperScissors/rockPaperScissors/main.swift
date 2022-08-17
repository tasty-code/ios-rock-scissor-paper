import Foundation

func makeComputerValue() -> Int {
    let randomComputerValue = Int.random(in: 1...3)
    
    return randomComputerValue
}

func checkUserValue(_ userValue: Int?) -> Int? {
    switch userValue {
    case 0:
        return nil
    case 1, 2, 3:
        return userValue
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
    
    return nil
}

func inputUserValue() -> Int? {
    let userValue = readLine()
    var integerUserValue: Int?
    
    if let value = userValue {
        integerUserValue = Int(value)
    }
    
    integerUserValue = checkUserValue(integerUserValue)
    
    return integerUserValue
}

func checkWinOrLose(_ userValue: Int,_ computerValue: Int) {
    let winCaseValue = userValue - computerValue
    
    switch winCaseValue {
    case -2, 1:
        print("이겼습니다!")
    case 0:
        print("비겼습니다!")
        startGame()
    default:
        print("졌습니다!")
    }
}

func inputGameValue() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    let computerValue = makeComputerValue()
    
    guard let userValue = inputUserValue() else {
        return
    }
    
    checkWinOrLose(userValue, computerValue)
}

func startGame() {
    inputGameValue()
}

startGame()

