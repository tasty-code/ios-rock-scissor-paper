//
//  ApplicationStatus.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

enum ApplicationStatus {
    case quit
    case error
}

extension ApplicationStatus {
    var message: String {
        switch self {
        case .quit:
            "게임종료"
        case .error:
            "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}
