import Foundation

func makeComputerValue() -> Int {
    return Int.random(in: 1...3)
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
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
func inputUserValue() {
    let userValue = readLine() ?? "nil"
    var integerUserValue: Int? = 0
    
    
    if let value = Int(userValue) {
        integerUserValue = value
    }
    
    integerUserValue = checkUserValue(integerUserValue)
    
    print(integerUserValue)
}

inputUserValue()
