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
    attackTurn = "사용자"
    playMukjjibba()
  } else {
    print("졌습니다")
    attackTurn = "컴퓨터"
    playMukjjibba()
  }
}

func playMukjjibba(){
  print("[\(attackTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료: 0> : ",terminator: "")
  let computerSelect = getRandomNum()
  guard let userSelcet = readLine() else { return }
  
  switch userSelcet {
  case exitMukjjibba:
    isRunning = false
    return
  case muk, jji, bba:
    let turnState = getMukjjibbaTurn(userSelcet: userSelcet, computerSelect: computerSelect)
    if turnState == "end" {
      print("\(attackTurn)의 승리!")
      isRunning = false
      return
    }
    if turnState == "change" {
      attackTurn = attackTurn == "사용자" ? "컴퓨터" : "사용자"
    }
    print("\(attackTurn)의 턴입니다.")
  default:
    print("잘못된 입력입니다. 다시 시도해주세요.")
  }
  
  playMukjjibba()
}

func getMukjjibbaTurn(userSelcet: String, computerSelect: String) -> String {
  var turnStatus: String
  if userSelcet == computerSelect {
    turnStatus = "end"
  } else if userSelcet == jji && computerSelect == bba ||
              userSelcet == muk && computerSelect == jji ||
              userSelcet == bba && computerSelect == muk {
    turnStatus = attackTurn == "사용자" ? "keep" : "change"
  } else {
    turnStatus = attackTurn == "컴퓨터" ? "keep": "change"
  }
  return turnStatus
}
