//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

let comNum = Int.random(in: 1..<4)
var boolGame: Bool = true


while(boolGame) {
    print("컴퓨터의 선택번호 \(comNum)")
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ")

    guard let userNum = Int(readLine() ?? "") else { throw NSError() }
    boolGame = RockPaperScissors(user: userNum, com: comNum)
}
print("게임 종료")

func RockPaperScissors(user: Int, com: Int) -> Bool{
    if user == com{
        print("비겼습니다.")
        return true
    }else if user == 1 && com == 2{
        print("졌습니다.")
        return false
    }else if user == 1 && com == 3{
        print("이겼습니다.")
        return false
    }else if user == 2 && com == 3{
        print("졌습니다.")
        return false
    }else if user == 2 && com == 1{
        print("이겼습니다.")
        return false
    }else if user == 3 && com == 1{
        print("졌습니다.")
        return false
    }else if user == 3 && com == 2{
        print("이겼습니다.")
        return false
    }else if user == 0 {
        return false
    }
    else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return true
    }
}

//
//func Mukchippa(winner: Bool){
//    print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ")
//
//    print("[\(RockPaperScissorsWinner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ")
//
//    print("\(FinalWinner)의 승리")
//}
