//
//  IO.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

protocol InputGettable {
    func printPrompt(_ prompt: String)
    func getInput() throws -> String
}

protocol OuputPritable {
    func printOutput(_ output: String)
}

protocol RPSErrorPrintable {
    func printRPSError(_ error: RPSError)
}

typealias IO = InputGettable & OuputPritable & RPSErrorPrintable

final class Console: InputGettable {
    func getInput() throws -> String {
        guard let pureInput = readLine() else { throw RPSError.invalidInput }
        let refinedInput = pureInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard refinedInput.isEmpty == false else { throw RPSError.invalidInput }
        return refinedInput
    }
    
    func printPrompt(_ prompt: String) {
        print(prompt, terminator: " ")
    }
}

extension Console: OuputPritable {
    func printOutput(_ output: String) {
        print(output)
    }
}

extension Console: RPSErrorPrintable {
    func printRPSError(_ error: RPSError) {
        print(error.description)
    }
}
