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
        //        isRunning = false
    } else {
        print("졌습니다")
        turn = "computer"
        //        isRunning = false
        game()
    }
}

func game2Start(userSelcet: String, computerSelect: String) {
//  var ruf =
  if userSelcet == computerSelect {
    print("\(turn)의 승리!")
    isRunning = false
  } else if userSelcet == scissors && computerSelect == paper ||
    userSelcet == rock && computerSelect == scissors ||
    userSelcet == paper && computerSelect == rock {
//    ruf = win lose
  } else {
    turn = "computer"
//    ruf = win lose
  }
  game()
}




func game(){
    print("[\(turn)] 묵(1), 찌(2), 빠(3)!, <종료: 0> : ",terminator: "")
    let computerSelect = getRandomNum()
    guard let userSelcet = readLine() else { return }
//    ruf game2Start(userSelcet: userSelcet, computerSelect: computerSelect)
    
//  if 결과값 처리
//    if turn == "user" {
//        game2Start(userSelcet: userSelcet, computerSelect: computerSelect)
//    } else {
//
//    }
    
}
