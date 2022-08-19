import Foundation

enum Player: String {
    case user = "사용자"
    case computer = "컴퓨터"
}
enum GameType {
    case normal
    case Mukjipa
}

let cardNumbersRange = 1...3
var winPlayer: String = ""
var type: GameType = .normal

func startGame() {
    printMenu()
    let computerNumber: Int = makeComputerNumber()
    let userNumber: Int = manageUserNumber()
    
    if isValidNumber(userNumber: userNumber) == false {
        return
    }
    if type == .normal {
        judgeNumber(computerNumber: computerNumber, userNumber: userNumber)
    } else {
        judgeMukjipaNumber(computerNumber: computerNumber, userNumber: userNumber)
    }
}

func printMenu() {
    if type == .normal {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    } else {
        print("[\(winPlayer) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
    
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

func isValidNumber(userNumber: Int) -> Bool {
    var isValidBool: Bool = true
    
    switch userNumber {
    case 0:
        isValidBool = false
    case cardNumbersRange:
        break
    default:
        invalidInputHandling()
        isValidBool = false
    }
    
    return isValidBool
}

func invalidInputHandling(winPlayer: String = "") {
    print("잘못된 입력입니다. 다시 시도해주세요.\n")
    startGame()
}

func judgeNumber(computerNumber: Int, userNumber: Int) -> Void {
    let computerAndUserNumber: [Int: Int] = [computerNumber: userNumber]
    
    switch computerAndUserNumber {
    case [1: 2], [2: 3], [3: 1]:
        print("이겼습니다!\n")
        changeGameTypeAndWinPlayer(winner: .user)
    case [1: 3], [2: 1], [3: 2]:
        print("졌습니다!\n")
        changeGameTypeAndWinPlayer(winner: .computer)
    default:
        print("비겼습니다!\n")
    }
    
    startGame()
}

func judgeMukjipaNumber(computerNumber: Int, userNumber: Int) -> Void {
    let computerAndUserNumber: [Int: Int] = [computerNumber: userNumber]
    
    switch computerAndUserNumber {
    case [1: 2], [2: 3], [3: 1]:
        winPlayer = Player.user.rawValue
        print("\(winPlayer)의 턴입니다\n")
        startGame()
    case [1: 3], [2: 1], [3: 2]:
        winPlayer = Player.computer.rawValue
        print("\(winPlayer)의 턴입니다\n")
        startGame()
    default:
        print("\(winPlayer)의 승리!\n")
    }
}

func changeGameTypeAndWinPlayer(winner: Player) {
    winPlayer = winner.rawValue
    type = GameType.Mukjipa
}

startGame()
