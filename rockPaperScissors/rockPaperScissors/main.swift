import Foundation

func makeComputerValue() -> Int {
    return Int.random(in: 1...3)
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
}

startGame()
