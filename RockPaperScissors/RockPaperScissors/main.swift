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
