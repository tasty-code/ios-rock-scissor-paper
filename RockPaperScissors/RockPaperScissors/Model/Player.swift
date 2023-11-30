//
//  Player.swift
//  RockPaperScissors
//
//  Created by misung & UngQ on 11/28/23.
//

class Player {
    private var _input: RockPaperScissor
    private var _isMyTurn: Bool
    private var _name: String
    
    var input: RockPaperScissor {
        get {
            return _input
        }
        set {
            _input = newValue
        }
    }
    
    var isMyTurn: Bool {
        get {
            return _isMyTurn
        }
        set {
            _isMyTurn = newValue
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    init(input: RockPaperScissor, isMyTurn: Bool = false, name: String) {
        self._input = input
        self._isMyTurn = isMyTurn
        self._name = name
    }
    
    func readInput(gameType: GameType) -> RockPaperScissor {
        if let input = Int(readLine() ?? "") {
            return convertInput(input, gameType: gameType)
        } else {
            return .noChoice
        }
    }
    
    func convertInput(_ input: Int, gameType: GameType) -> RockPaperScissor {
        switch input {
        case 0:
            return .exitGame
        case 1:
            return gameType == .rockPaperScissors ? .scissor : .rock
        case 2:
            return gameType == .rockPaperScissors ? .rock : .scissor
        case 3:
            return .paper
        default:
            return .noChoice
        }
    }
    
    func randomRockScissorPaperInput(gameType: GameType) -> RockPaperScissor {
        let randomInput = Int.random(in: 1...3)
        return convertInput(randomInput, gameType: gameType)
    }
}
