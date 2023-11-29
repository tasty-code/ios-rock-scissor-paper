////
////  main2.swift
////  RockPaperScissors
////
////  Created by 김동준 on 11/28/23.
////
//
//import Foundation
//
//enum ChoiceMenu: String, CaseIterable {
//    case scissor = "1", rock = "2", paper = "3", exit = "0"
//}
//
//
//enum Result: String {
//    case win = "이겼습니다."
//    case lose = "졌습니다."
//    case draw = "비겼습니다."
//    case errorDefault = "잘못된 입력입니다. 다시 시도해주세요."
//    case quitGame = "게임종료"
//}
//
//func endGame() {
//    isWorking = false
//    print("게임종료")
//}
//
//func displayStartMessage() {
//    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
//}
//
////함수명 변경 startGmae -> calculateResult
//func calculateResult(comInput: ChoiceMenu, userInput: ChoiceMenu) -> Result {
//    if userInput == comInput {
//        return .draw
//    } else if userInput == .exit {
//        return .quitGame
//    } else if (comInput == .scissor && userInput == .rock) ||
//                (comInput == .rock && userInput == .paper) ||
//                (comInput == .paper && userInput == .scissor) {
//        return .win
//    } else {
//        return .lose
//    }
//}
//
//var isWorking: Bool = true
//
//while isWorking {
//    displayStartMessage()
//    
//    if let userInput = readLine(), let userPick = ChoiceMenu(rawValue: userInput) {
//        guard let comPick = ChoiceMenu.allCases.filter({ $0 != .exit }).randomElement() else { continue }
//        
//        //결과값 받는 메서드 추가
//        let result: Result = calculateResult(comInput: comPick, userInput: userPick)
//        print(result.rawValue)
//        
//        
//        if result == .win || result == .lose {
//            endGame()
//        } else if result == .quitGame {
//            isWorking = false
//        } else if result == .draw {
//            continue
//        } else {
//            print("잘못된 입력입니다. 다시 시도해주세요.")
//        }
//    }
//}
