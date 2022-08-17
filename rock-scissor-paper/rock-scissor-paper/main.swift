import Foundation

func getMenuInput() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let input = readLine() else {
        return Int()
    }
    
    guard let intInput = Int(input) else {
        return Int()
    }
    
    return intInput
}

func createRandomNumber() -> Int {
    let computerRandomNumber = Int.random(in: 1...3)
    
    return computerRandomNumber
}
