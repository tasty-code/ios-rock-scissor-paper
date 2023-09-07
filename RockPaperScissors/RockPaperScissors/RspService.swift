//
//  RspService.swift
//  RockPaperScissors
//
//  Created by Janine on 2023/09/07.
//

import Foundation

enum  Alert: String {
    case tryAgain = "잘못된 입력입니다. 다시 시도해주세요."
    case end = "게임 종료"
    case draw = "비겼습니다!"
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case prompt = "가위(1), 바위(2), 보(3)! <종료 : 0> :"
}

struct RspService {
    private var userInput: Int?
    private var computerValue: Int
    
    mutating func getUserInput() {
        let tempUserInput = readLine()
        guard let stringUserInput = tempUserInput else {
            return
        }
        guard let intUserInput = Int(stringUserInput) else {
            return
        }
        userInput = intUserInput
    }
    
    mutating func checkInputValidation() {
        switch self.userInput {
        case 0:
            endGame()
        case 1,2,3:
            getComputerValue()
        default:
            print(Alert.tryAgain.rawValue)
        }
    }
    
    mutating func getComputerValue() {
        computerValue = Int.random(in: 1...3)
    }
    
    func endGame() {
        print(Alert.end.rawValue)
    }

}
