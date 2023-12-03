//
//  HandGameApp.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

struct HandGameApp {
    private let errorDisplay: HandGameErrorDisplayble
    
    init(errorDisplay: HandGameErrorDisplayble) {
        self.errorDisplay = errorDisplay
    }
    
    private func prepareUsers() -> (HandGamePlayable, HandGamePlayable) {
        let leftPlayer: HandGamePlayable = UserPlayer(io: console, name: "에피")
        let rightPlayer: HandGamePlayable = ComputerPlayer()
        return (leftPlayer, rightPlayer)
    }
    
    private func startGame(with leftPlayer: HandGamePlayable, and rightPlayer: HandGamePlayable) {
        do {
            let rpsGame = RPSGame(between: leftPlayer, and: rightPlayer)
            let (rpsWinner, rpsLoser) = try rpsGame.start()
            guard var mjbGame = MJBGame(rpsWinner: rpsWinner, rpsLoser: rpsLoser) else { return }
            try mjbGame.start()
        } catch HandGameError.someoneWantsToExit {
            errorDisplay.displayRPSError(HandGameError.someoneWantsToExit)
        } catch { return }
    }
    
    func run() {
        let playerDuo = prepareUsers()
        startGame(with: playerDuo.0, and: playerDuo.1)
    }
}
