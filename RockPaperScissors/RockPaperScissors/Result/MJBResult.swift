//
//  MJBResult.swift
//  RockPaperScissors
//
//  Created by Effie on 11/29/23.
//

import Foundation

enum MJBResult {
    case win
    case regame(nextTurn: MJBPlayable)
}
