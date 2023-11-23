//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

var run: Bool = true
var menuMessage: MenuMessage = .rps

enum RpsGameResult: CustomStringConvertible {
    case win, draw, lose
    
    var description: String {
        switch (self) {
        case .win:
            return "이겼습니다!"
        case .draw:
            return "비겼습니다!"
        case .lose:
            return "졌습니다!"
        }
    }
    
    func isOver(result: RpsGameResult) -> Bool {
        switch (result) {
        case .win, .lose:
            return false
        case .draw:
            return true
        }
    }
}

enum MenuMessage: CustomStringConvertible {
    case rps
    
    var description: String {
        switch (self) {
        case .rps:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        }
    }
}

func getUserInput() -> Int? {
    if let input = readLine() {
        return Int(input)
    } else {
        return nil
    }
}

func rpsGame(userInput: Int, cpuInput: Int) -> Bool {
    switch (userInput) {
    case 0:
        return false
    case 1...3:
        let result: RpsGameResult = judgeWinOrLose(userInput: userInput, cpuInput: cpuInput)
        print(result)
        return result.isOver(result: result)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return true
    }
}

func judgeWinOrLose(userInput: Int, cpuInput: Int) -> RpsGameResult {
    if (userInput == cpuInput) {
        return RpsGameResult.draw
    } else if (userInput - cpuInput == 1 || userInput - cpuInput == -2) {
        return RpsGameResult.win
    } else {
        return RpsGameResult.lose
    }
}

func initCpuInput() -> Int {
    return Int.random(in: 1...3)
}

while (run) {
    print(menuMessage, terminator: "")
    let cpuInput: Int = initCpuInput()
    let userInput: Int = getUserInput() ?? -1
    run = rpsGame(userInput: userInput, cpuInput: cpuInput)
}
print("게임 종료")
