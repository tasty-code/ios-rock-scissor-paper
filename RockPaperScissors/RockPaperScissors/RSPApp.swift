//
//  RSPApp.swift
//  RockPaperScissors
//
//  Created by Roh on 11/22/23.
//

import Foundation

final class RSPApp {
    private var isRunning: Bool = true
    
    private let invalidErrorMessage: String = "잘못된 입력입니다. 다시 시도해주세요."
    
    let judge: Judge = Judge()
    
    var userPlayer: UserPlayer?
    
    var pcPlayer: PCPlayer?
    
    func run() {
        while isRunning {
            printPrompt()
            guard let input = getInput(),
                  let intInput = Int(input),
                  let menu = Menu(input: intInput) else { #warning("상수")
                printInvalidErrorMessage()
                continue
            }
            processMenu(menu)
        }
    }
}

extension RSPApp {
    private func processMenu(_ menu: Menu) {
        switch menu {
        case .rsp(let userHand):
            self.userPlayer = UserPlayer(hand: userHand)
            self.pcPlayer = PCPlayer()
            guard let userPlayer, let pcPlayer else {
                return
            }
            let result = judge.judgeIf(userPlayer, wins: pcPlayer)
            handleResult(result)
        case .exit:
            exit()
        }
    }
    
    private func handleResult(_ result: RSPResult) {
        switch result {
        case .tie:
            print("비겼습니다!")
        case .winning(let winner):
            if let winner = winner as? UserPlayer, winner === userPlayer {
                print("이겼습니다!")
            } else {
                print("졌습니다!")
            }
            exit()
        }
    }
    
    private func exit() {
        print("게임 종료")
        self.isRunning = false
    }
}

extension RSPApp {
    private func getInput() -> String? {
        guard let pureInput = Swift.readLine() else { return nil }
        let result = pureInput.trimmingCharacters(in: .whitespacesAndNewlines)
        return result.isEmpty ? nil : result
    }
    
    private func printInvalidErrorMessage() {
        print(invalidErrorMessage)
    }
    
    private func printPrompt() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
}
 
