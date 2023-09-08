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
    let result:String = RockPaperScissors()
    switch result {
    case "비겼습니다.": // 다시 복귀
        print(result)
        break
    case "이겼습니다.":
        print(result)
        go = false
        break
    case "졌습니다.":
        print(result)
        go = false
        break
    case "0":// 게임 종료
        go = false
        break
    case "잘못된 입력입니다. 다시 시도해주세요.": // 다시 복귀
        print(result)
        break
    default:
        break
    }
}

print("게임 종료")

func RockPaperScissors() -> String {
    let comNum = Int.random(in: 1..<4)
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    guard let userNum = readLine() else {
        return "잘못된 입력입니다."
    }
    guard let uChoice = Int(userNum) else {
        return "잘못된 입력입니다."
    }
    if uChoice == comNum {
        return "비겼습니다."
    } else if uChoice == Choice.scissor.rawValue && comNum == Choice.rock.rawValue {
        return "졌습니다."
    } else if uChoice == Choice.scissor.rawValue && comNum == Choice.paper.rawValue {
        return "이겼습니다."
    } else if uChoice == Choice.rock.rawValue && comNum == Choice.paper.rawValue {
        return "졌습니다."
    } else if uChoice == Choice.rock.rawValue && comNum == Choice.scissor.rawValue {
        return "이겼습니다."
    } else if uChoice == Choice.paper.rawValue && comNum == Choice.scissor.rawValue {
        return "졌습니다."
    } else if uChoice == Choice.paper.rawValue && comNum == Choice.rock.rawValue {
        return "이겼습니다."
    } else if uChoice == Choice.end.rawValue {
        return "0"
    } else {
        return "잘못된 입력입니다. 다시 시도해주세요."
    }
}
