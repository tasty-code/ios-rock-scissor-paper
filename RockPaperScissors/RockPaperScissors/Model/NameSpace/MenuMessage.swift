//
//  MenuMessage.swift
//  RockPaperScissors
//
//  Created by misung & UngQ on 11/28/23.
//

enum MenuMessage: CustomStringConvertible {
    case rockPaperScissors, 
         mukJjiPpa
    
    var description: String {
        switch self {
        case .rockPaperScissors:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        case .mukJjiPpa:
            return "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        }
    }
}
