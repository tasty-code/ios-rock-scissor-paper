//
//  Utillity.swift
//  RockPaperScissors
//
//  Created by 김경록 on 2023/09/07.
//

import Foundation

func getRandomNum() -> String {
    return String(Int.random(in: 1...3))
}

func getRPSResult(userSelcet: String, computerSelect: String) {
    if userSelcet == computerSelect {
        print("비겼습니다")
    } else if userSelcet == scissors && computerSelect == paper ||
                userSelcet == rock && computerSelect == scissors ||
                userSelcet == paper && computerSelect == rock {
        print("이겼습니다")
        turn = "user"
        game()
        
    } else {
        print("졌습니다")
        turn = "computer"
        game()
    }
}

func game(){
    print("[\(turn)]턴 묵(1), 찌(2), 빠(3)!, <종료: 0> : ",terminator: "")
    let computerSelect = getRandomNum()
    guard let userSelcet = readLine() else { return }
    
   let result = game2Start(userSelcet: userSelcet, computerSelect: computerSelect)
    print("\(turn)턴 입니다. 유저\(userSelcet) 컴\(computerSelect)")
    if result == "win" {
        game()
        
    } else if result == "lose" {
        turn = turn == "user" ? "computer" : "user"
        game()
        
    } else {
      isRunning = false
    }
  
}

func game2Start(userSelcet: String, computerSelect: String) -> String {
    var result: String = ""
    if userSelcet == computerSelect {
        print("\(turn)의 승리!")
//        isRunning = false
    } else if userSelcet == scissors && computerSelect == paper ||
                userSelcet == rock && computerSelect == scissors ||
                userSelcet == paper && computerSelect == rock {
        result = "win"
    } else {
        turn = "computer"
        result = "lose"
    }
    return result
}
