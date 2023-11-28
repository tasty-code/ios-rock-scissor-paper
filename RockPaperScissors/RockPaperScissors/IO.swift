//
//  IO.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

protocol IO {
    func getInput() throws -> String
    func printPrompt(_ prompt: String)
    func printOutput(_ output: String)
}

class ConsoleManager: IO {
    func getInput() throws -> String {
        guard let pureInput = readLine() else { throw RPSError.invalidInput }
        let refinedInput = pureInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard refinedInput.isEmpty == false else { throw RPSError.invalidInput }
        return refinedInput
    }
    
    func printPrompt(_ prompt: String) {
        print(prompt, terminator: "")
    }
    
    func printOutput(_ output: String) {
        print(output)
    }
}
