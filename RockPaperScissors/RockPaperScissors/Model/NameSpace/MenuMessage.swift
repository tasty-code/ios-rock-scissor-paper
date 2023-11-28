//
//  MenuMessage.swift
//  RockPaperScissors
//
//  Created by Minho on 11/28/23.
//

enum MenuMessage: CustomStringConvertible {
    case rps, mjb
    
    var description: String {
        switch self {
        case .rps:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        case .mjb:
            return "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        }
    }
}
