//
//  User.swift
//  RockPaperScissors
//

import Foundation

struct User {
    func chooseOption() -> String {
        return typeInput()
    }
    
    private func typeInput() -> String {
        guard let Input = readLine() else {
            return String()
        }
        return Input
    }
}
