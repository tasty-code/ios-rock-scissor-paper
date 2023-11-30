//
//  Game.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

protocol Game {
    associatedtype ChoiceType 
    mutating func play()
    mutating func continueGame() -> Bool
    mutating func compareChoice(user: ChoiceType, computer: ChoiceType) -> Bool
}
