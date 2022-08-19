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

func checkUserValue(_ userValue: Int?) -> Int? {
    switch userValue {
    case 0:
        return nil
    case 1, 2, 3:
        return userValue
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        inputGameValue()
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
    let compareValue = (userValue, computerValue)
    
    switch compareValue {
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
        inputGameValue()
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
inputGameValue()
