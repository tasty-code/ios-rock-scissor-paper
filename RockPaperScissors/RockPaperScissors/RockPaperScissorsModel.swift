//
//  RockPaperScissorsModel.swift
//  RockPaperScissors
//
//  Created by Designer on 11/28/23.
//

import Foundation

class RockPaperScissorsModel {
    private var queue: [RockPaperScissors] = [.scissors, .rock, .paper]
    
    func enqueue(_ rockPaperScissors: RockPaperScissors) {
        queue.append(rockPaperScissors)
    }
    
    func dequeue() -> RockPaperScissors {
        return queue.removeFirst()
    }
    
    func getRockPaperScissors() -> RockPaperScissors {
        let rockPaperScissors = dequeue()
        enqueue(rockPaperScissors)
        return rockPaperScissors
    }
    
    func setHead(head: RockPaperScissors) {
        var now: RockPaperScissors
        repeat {
            now = getRockPaperScissors()
        } while now == head
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
}
