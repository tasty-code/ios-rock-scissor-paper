//
//  PlayerModel.swift
//  RockPaperScissors
//
//  Created by Minho on 11/28/23.
//

class Player {
    private var _input: RockPaperScissor
    private var _isMyTurn: Bool
    
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
    
    init(input: RockPaperScissor, isMyTurn: Bool = false) {
        self._input = input
        self._isMyTurn = isMyTurn
    }
}
