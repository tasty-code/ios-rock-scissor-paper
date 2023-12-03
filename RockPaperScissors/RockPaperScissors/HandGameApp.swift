//
//  HandGameApp.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

struct HandGameApp {
    private func prepareUsers() -> (HandGamePlayable, HandGamePlayable) {
        let leftPlayer: HandGamePlayable = UserPlayer(io: Console(), name: "에피")
        let rightPlayer: HandGamePlayable = ComputerPlayer()
//        let rightPlayer: HandGamePlayable = UserPlayer(io: Console(), name: "노움")
        return (leftPlayer, rightPlayer)
    }
    
    private func startGame(with leftPlayer: HandGamePlayable, and rightPlayer: HandGamePlayable) {
        do {
            let rpsGame = RPSGame(between: leftPlayer, and: rightPlayer)
            let (rpsWinner, rpsLoser) = try rpsGame.start()
            
            guard let turn = rpsWinner as? MJBPlayable,
                  let other = rpsLoser as? MJBPlayable else { return }
            
            var mjbGame = MJBGame(turn: turn, other: other)
            try mjbGame.start()
        } catch HandGameError.someoneWantsToExit {
            [leftPlayer, rightPlayer].forEach { player in
                if let errorDisplayablePlayer = player as? HandGameErrorDisplayblePlayer {
                    errorDisplayablePlayer.displayRPSError(HandGameError.someoneWantsToExit)
                }
            }
        } catch { return }
    }
    
    func run() {
        let playerDuo = prepareUsers()
        startGame(with: playerDuo.0, and: playerDuo.1)
    }
}
