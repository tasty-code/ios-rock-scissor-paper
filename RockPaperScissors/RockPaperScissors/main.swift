//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

enum Choice: Int {
    case end = 0
    case rock = 2
    case paper = 3
    case scissor = 1
}
var go: Bool = true

while(go) {
    let computerNum = Int.random(in: 1..<4)
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    guard let userNum = readLine() else {
        throw NSError()
    }
    guard let userChoice = Int(userNum) else {
        throw NSError()
    }
    let result:String = RockPaperScissors(user: userChoice, computer: computerNum)
    switch result {
    case "비겼습니다.": // 다시 복귀
        print(result)
    case "이겼습니다.":
        print(result)
        go = false
    case "졌습니다.":
        print(result)
        go = false
    case "0":// 게임 종료
        go = false
    case "잘못된 입력입니다. 다시 시도해주세요.": // 다시 복귀
        print(result)
    default:
        break
    }
}

print("게임 종료")

func RockPaperScissors(user: Int, computer: Int) -> String {
   
    if user == computer {
        return "비겼습니다."
    } else if user == Choice.scissor.rawValue && computer == Choice.rock.rawValue {
        return "졌습니다."
    } else if user == Choice.scissor.rawValue && computer == Choice.paper.rawValue {
        return "이겼습니다."
    } else if user == Choice.rock.rawValue && computer == Choice.paper.rawValue {
        return "졌습니다."
    } else if user == Choice.rock.rawValue && computer == Choice.scissor.rawValue {
        return "이겼습니다."
    } else if user == Choice.paper.rawValue && computer == Choice.scissor.rawValue {
        return "졌습니다."
    } else if user == Choice.paper.rawValue && computer == Choice.rock.rawValue {
        return "이겼습니다."
    } else if user == Choice.end.rawValue {
        return "0"
    } else {
        return "잘못된 입력입니다. 다시 시도해주세요."
    }
}
