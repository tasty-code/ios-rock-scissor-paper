//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

func choiceRockScissorsPaper() {
    let isRunning: Bool = true
    
    while isRunning {
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        guard let input = readLine() else { return }
        
        switch input {
        case "0":
            return
        case "1":
            return
        case "2":
            return
        case "3":
            return
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
         continue
        }
    }
}

choiceRockScissorsPaper()

