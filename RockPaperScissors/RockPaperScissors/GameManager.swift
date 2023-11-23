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
        showOptions()
        
        let user = User()
        let userOption: String = user.chooseOption()
        
        guard userOption != termination else {
            notifyGameOver()
            endGame()
            
            return
        }
        
        guard let userSelectedNumber = Int(userOption),
                let userChoice = getUserChoice(from: userSelectedNumber) else {
            notifyInvalidOption()
            
            return
        }
        
    }
    
    private mutating func endGame() {
        willRun.toggle()
    }
    
    private func getUserChoice(from userSelectedNumber: Int) -> RockPaperScissors? {
        return RockPaperScissors(rawValue: userSelectedNumber)
    }
    
    private func showOptions() {
        print("가위(1), 바위(2), 보(3)! <종료: 0> :")
    }
    
    private func notifyGameOver() {
        print("게임 종료")
    }
    
    private func notifyInvalidOption(){
        print("잘못된 입력입니다. 다시 시도해 주세요.")
    }
}
