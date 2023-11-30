//
//  RockPaperScissorsModel.swift
//  RockPaperScissors
//
//  Created by Designer on 11/28/23.
//

import Foundation

class RockPaperScissorsModel {
    private var queue: [RockPaperScissors] = [.scissors, .rock, .paper]
    
    private func enqueue(_ rockPaperScissors: RockPaperScissors) {
        queue.append(rockPaperScissors)
    }
    
    private func dequeue() -> RockPaperScissors {
        return queue.removeFirst()
    }
    
    private func nextRockPaperScissors() -> RockPaperScissors {
        let rockPaperScissors = dequeue()
        enqueue(rockPaperScissors)
        return rockPaperScissors
    }
    
    private func setHead(head: RockPaperScissors) {
        var now: RockPaperScissors
        repeat {
            now = nextRockPaperScissors()
        } while now != head
    }
    
    func matchResult(_ firstPlayer: Player, _ secondPlayer: Player) -> Match {
        setHead(head: firstPlayer.playerSelect)
        
        if secondPlayer.playerSelect == nextRockPaperScissors() {
            return .lose
        }
        
        if secondPlayer.playerSelect == nextRockPaperScissors() {
            return .win
        }
        
        return .draw
    }
    
    func random() -> RockPaperScissors {
        return queue[Int.random(in: 0...2)]
    }
    
    func convertRockPaperScissors(_ input: RockPaperScissors) -> RockPaperScissors {
        switch input {
        case .scissors:
            return .rock
        case .rock:
            return .scissors
        default:
            return input
        }
    }
}
