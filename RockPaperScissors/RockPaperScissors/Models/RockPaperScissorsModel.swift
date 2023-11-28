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
    
    private func getRockPaperScissors() -> RockPaperScissors {
        let rockPaperScissors = dequeue()
        enqueue(rockPaperScissors)
        return rockPaperScissors
    }
    
    private func setHead(head: RockPaperScissors) {
        var now: RockPaperScissors
        repeat {
            now = getRockPaperScissors()
        } while now != head
    }
    
    func matchResult(firstPlayer: RockPaperScissors, secondPlayer: RockPaperScissors) -> Match {
        setHead(head: firstPlayer)
        
        if secondPlayer == getRockPaperScissors() {
            return .lose
        }
        
        if secondPlayer == getRockPaperScissors() {
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
