import Foundation

let cardNumbersRange = 1...3

func startGame() {
    printMenu()
    let computerNumber: Int = makeComputerNumber()
    let userNumber: Int = manageUserNumber()
    if isValidNumber(type: "normal",userNumber: userNumber) == false {
        return
    }
    judgeNumber(computerNumber: computerNumber, userNumber: userNumber)
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func startMukJiPa(winPlayer: String) {
    printGame(winPlayer: winPlayer)
    let computerNumber: Int = makeComputerNumber()
    let userNumber: Int = manageUserNumber()
    
    if isValidNumber(type: "MukJiPa", userNumber: userNumber) == false {
        return
    }
    
    judgeMukJiPaNumber(winPlayer: winPlayer, computerNumber: computerNumber, userNumber: userNumber)
}

func printGame(winPlayer: String) {
    print("[\(getWinPlayerName(winPlayer: winPlayer)) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
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

func isValidNumber(type: String, userNumber: Int) -> Bool {
    var isValidBool: Bool = true
    switch userNumber {
    case 0:
        isValidBool = false
    case cardNumbersRange:
        break
    default:
        invalidInputHandling(type: type)
        isValidBool = false
    }
    
    return isValidBool
}

func invalidInputHandling(type: String, winPlayer: String = "") {
    print("잘못된 입력입니다. 다시 시도해주세요.\n")
    startGame()
    if type == "normal" {
        startGame()
    } else {
        startMukJiPa(winPlayer: <#T##String#>)
    }
}

func judgeNumber(computerNumber: Int, userNumber: Int) -> Void {
    let computerAndUserNumber: [Int: Int] = [computerNumber: userNumber]
    
    switch computerAndUserNumber {
    case [1: 2], [2: 3], [3: 1]:
        print("이겼습니다!\n")
        startMukJiPa(winPlayer: "user")
    case [1: 3], [2: 1], [3: 2]:
        print("졌습니다!\n")
        startMukJiPa(winPlayer: "computer")
    default:
        print("비겼습니다!\n")
    }
    
    startGame()
}

func judgeMukJiPaNumber(winPlayer: String, computerNumber: Int, userNumber: Int) -> Void {
    let computerAndUserNumber: [Int: Int] = [computerNumber: userNumber]
    
    switch computerAndUserNumber {
    case [1: 2], [2: 3], [3: 1]:
        print("")
        startMukJiPa(winPlayer: winPlayer)
    case [1: 3], [2: 1], [3: 2]:
        
        startMukJiPa(winPlayer: winPlayer)
    default:
        print("\(getWinPlayerName(winPlayer: winPlayer))의 승리!")
    }
}

func getWinPlayerName(winPlayer: String) -> String {
    let player: [String: String] = ["computer": "컴퓨터", "user": "사용자"]
    if let winPlayerName = player[winPlayer] {
        return winPlayerName
    }
    return "-"
}

startGame()
