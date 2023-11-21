//
//  Result.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

enum Result {
    case draw
    case win
    case lose
    case quit
    case error
}

extension Result: CustomStringConvertible {
    var description: String {
        switch self {
        case .draw:
            "비겼습니다!"
        case .win:
            "이겼습니다!"
        case .lose:
            "졌습니다!"
        case .quit:
            "게임종료"
        case .error:
            "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}
