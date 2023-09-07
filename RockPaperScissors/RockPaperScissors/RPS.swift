//
//  RPS.swift
//  RockPaperScissors
//
//  Created by 김경록 on 2023/09/07.
//

enum RPSOption: String {
    case exit = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

let exit = RPSOption.exit.rawValue
let scissors = RPSOption.scissors.rawValue
let rock = RPSOption.rock.rawValue
let paper = RPSOption.paper.rawValue

enum Mukjjibba: String {
  case exit = "0"
  case muk = "1"
  case jji = "2"
  case bba = "3"
}

let exitGame2 = Mukjjibba.exit.rawValue
let muk = Mukjjibba.muk.rawValue
let jji = Mukjjibba.jji.rawValue
let bba = Mukjjibba.bba.rawValue
