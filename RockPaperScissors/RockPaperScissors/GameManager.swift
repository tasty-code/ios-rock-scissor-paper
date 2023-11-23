//
//  GameManager.swift
//  RockPaperScissors
//

import Foundation

struct GameManager {
    private enum RockPaperScissors: Int, CaseIterable {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    private enum GameOutcome {
        case draw, win, loss
        
        func notify() {
            switch self {
            case .draw:
                print("비겼습니다!")
            case .win:
                print("이겼습니다!")
            case .loss:
                print("졌습니다!")
            }
        }
    }
    
    let termination: String = "0"
    var willRun: Bool = true
    
    func canPlayGame() -> Bool {
        return willRun
    }
    
    mutating func playGame() {
        print("가위(1), 바위(2), 보(3)! <종료: 0> :")
        
        let user = User()
        let userOption: String = user.chooseOption()
        
        guard userOption != termination else {
            notifyGameOver()
            endGame()
            
            return
        }
    }
    
    func notifyGameOver() {
        print("게임 종료")
    }
    
    mutating func endGame() {
        willRun.toggle()
    }
}
