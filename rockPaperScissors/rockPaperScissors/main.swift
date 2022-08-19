import Foundation

enum RockScissorPaper: Int {
    case scissor = 1
    case rock = 2
    case paper = 3
}

func makeComputerValue() -> Int {
    let randomNumberRange = 1...3
    let randomComputerValue = Int.random(in: randomNumberRange)
    
    return randomComputerValue
}

func checkUserValue(_ userValue: Int) -> Int {
    switch userValue {
    case 0:
        return 0
    case 1, 2, 3:
        return userValue
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
    
    return 0
}

func inputUserValue() -> Int {
    guard let userValue = readLine(), let value = Int(userValue) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
        return 0
    }
    
    let checkValue = checkUserValue(value)
    return checkValue
}

func checkWinOrLose(_ userValue: Int,_ computerValue: Int) {
    let compareValue = (userValue, computerValue)
    
    switch compareValue {
    case (0, _):
        break
    case (RockScissorPaper.scissor.rawValue, RockScissorPaper.paper.rawValue):
        print("이겼습니다!")
    case (RockScissorPaper.scissor.rawValue, RockScissorPaper.rock.rawValue):
        print("졌습니다!")
    case (RockScissorPaper.rock.rawValue, RockScissorPaper.scissor.rawValue):
        print("이겼습니다!")
    case (RockScissorPaper.rock.rawValue, RockScissorPaper.paper.rawValue):
        print("졌습니다")
    case (RockScissorPaper.paper.rawValue, RockScissorPaper.rock.rawValue):
        print("이겼습니다!")
    case (RockScissorPaper.paper.rawValue, RockScissorPaper.scissor.rawValue):
        print("졌습니다!")
    default:
        print("비겼습니다!")
        startGame()
    }
}

func gameMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func startGame() {
    gameMenu()
    let computerValue = makeComputerValue()
    let userValue = inputUserValue()
    
    checkWinOrLose(userValue, computerValue)
}

startGame()
