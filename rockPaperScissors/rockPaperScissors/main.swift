import Foundation

func makeComputerValue() -> Int {
    return Int.random(in: 1...3)
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
}

func inputUserValue() {
    let userValue = readLine() ?? "nil"
    
    if let value = Int(userValue) {
        print(value)
    }
}

inputUserValue()
