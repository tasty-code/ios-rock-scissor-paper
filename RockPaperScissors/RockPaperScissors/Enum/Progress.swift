//
//  Progress.swift
//  RockPaperScissors
//
//  Created by Janine on 2023/09/11.
//

import Foundation

enum Progress: String {
    case notYet = "시작 전"
    case prompt = "가위(1), 바위(2), 보(3)! <종료 : 0> :"
    case tryAgain = "잘못된 입력입니다. 다시 시도해주세요."
    case onGoing = "계속"
    case end = "게임 종료"
}
