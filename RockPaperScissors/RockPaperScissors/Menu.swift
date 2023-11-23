//
//  Menu.swift
//  RockPaperScissors
//
//  Created by Roh on 11/22/23.
//

import Foundation

enum Menu {
    case rsp(userHand: Hand)
    case exit
    
    init?(input: Int) {
        if let hand = Hand(rawValue: input) {
            self = .rsp(userHand: hand)
        } else if input == 0 {
            self = .exit
        } else {
            return nil
        }
    }
}
