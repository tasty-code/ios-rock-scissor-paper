//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation



enum RpsCase: Int{
    case scissors = 1
    case rock
    case paper
}




//----------Funtion--------//

func rpsMenu() {
    print("가위(1), 바위(2) 보(3)! <종료: 0>")
}

func comRandomInput() -> Int{
    return Int.random(in: 1 ... 3)
}

func compareRps(user: RpsCase, com: RpsCase) {
    switch (user, com) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        print("이겼습니다.")
        print("게임 종료")
    case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
        print("졌습니다.")
        print("게임 종료")
    default:
        print("비겼습니다.")
        rpsMenu()
    }
}
