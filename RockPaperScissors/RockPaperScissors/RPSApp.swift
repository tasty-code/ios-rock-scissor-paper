//
//  RPSApp.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

final class RPSApp {
    private var isRunning: Bool = true
    
    private let io: IO
    
    init(io: IO) {
        self.io = io
    }
    
    func run() {
        do {
            let turn = try RPSGame(io: self.io).play()
            try MJBGame(io: self.io, turn: turn).play()
        } catch {
            switch error {
            case RPSError.userWantsToExit:
                io.printOutPut("게임 종료")
            default:
                return
            }
        }
    }
}
