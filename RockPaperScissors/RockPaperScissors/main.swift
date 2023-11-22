//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

var run: Bool = true
var menuMessage: MenuMessage = .rps

enum Rps: Int, CustomStringConvertible {
    case rock, paper, scissors
    
    var description: String {
        switch (self) {
        case .rock:
            return "바위"
        case .paper:
            return "보"
        case .scissors:
            return "가위"
        }
    }
}

enum MenuMessage: CustomStringConvertible {
    case rps, mjp
    
    var description: String {
        switch (self) {
        case .rps:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        case .mjp:
            return "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        }
    }
}

func printMsg(message: String, newLine: Bool) {
    switch (newLine) {
    case true:
        print(message)
    case false:
        print(message, terminator: "")
    }
}

func getInput() -> Int? {
    if let input = readLine() {
        return Int(input)
    } else {
        return nil
    }
}

func rpsGame(userInput: Int) {
    switch (userInput) {
    case 0:
        print("게임 종료")
    case 1:
        print("1번 입력")
    case 2:
        print("2번 입력")
    case 3:
        print("3번 입력")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

while (run) {
    printMsg(message: menuMessage.description, newLine: false)
    var userInput: Int = getInput() ?? -1
    rpsGame(userInput: userInput)
}
