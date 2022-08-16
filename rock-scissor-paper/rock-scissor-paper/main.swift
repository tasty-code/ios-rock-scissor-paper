import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func getUserNumber() -> Int {
    let userNumber: Int = Int(readLine() ?? "") ?? -1
    
    return 0
}

func isValidNumber(userNumber: Int) -> Bool {
    
    return true
}
