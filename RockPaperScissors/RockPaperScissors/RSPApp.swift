//
//  RSPApp.swift
//  RockPaperScissors
//
//  Created by Roh on 11/22/23.
//

import Foundation

final class RSPApp {
    private var isRunning: Bool = true
    
    private let judge: Judge = Judge()
    
    private var userPlayer: UserPlayer?
    
    private var pcPlayer: PCPlayer?
    
    func run() {
        while self.isRunning {
            printMessage(.menuPrompt, terminator: " ")
            guard let input = getInput(),
                  let intInput = Int(input),
                  let menu = Menu(input: intInput) else {
                printMessage(.invalidError)
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
            playOneRound(with: userHand)
        case .exit:
            exit()
        }
    }
    
    private func playOneRound(with userHand: Hand) {
        self.userPlayer = UserPlayer(hand: userHand)
        self.pcPlayer = PCPlayer()
        guard let userPlayer, let pcPlayer else {
            return
        }
        let result = self.judge.judgeBetween(userPlayer, pcPlayer)
        handleResult(result)
    }
    
    private func handleResult(_ result: RSPResult) {
        switch result {
        case .tie:
            printMessage(.tie)
        case .winning(let player):
            judgeIfUserWins(winner: player)
            exit()
        }
    }
    
    private func judgeIfUserWins(winner: RSPPlayable) {
        if let winner = winner as? UserPlayer, winner === self.userPlayer {
            printMessage(.winning)
        } else {
            printMessage(.losing)
        }
    }
    
    private func exit() {
        printMessage(.exit)
        self.isRunning = false
    }
}

extension RSPApp {
    private enum Message: String {
        case menuPrompt = "가위(1), 바위(2), 보(3)! <종료 : 0> :"
        case invalidError = "잘못된 입력입니다. 다시 시도해주세요."
        case winning = "이겼습니다!"
        case losing = "졌습니다!"
        case tie = "비겼습니다!"
        case exit = "게임 종료"
    }
    
    private func getInput() -> String? {
        guard let pureInput = Swift.readLine() else { return nil }
        let result = pureInput.trimmingCharacters(in: .whitespacesAndNewlines)
        return result.isEmpty ? nil : result
    }
    
    private func printMessage(_ message: Message, terminator: String? = nil) {
        Swift.print(message.rawValue, terminator: terminator ?? "\n")
    }
}
