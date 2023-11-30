//
//  RockScissorsPaperResult.swift
//  RockPaperScissors
//
//  Created by Taewan Kim on 11/30/23.
//

import Foundation

enum RockScissorsPaperResult{
    case win
    case lose
    case draw
}

extension RockScissorsPaperResult: CustomStringConvertible {
    var description: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        }
    }
}
