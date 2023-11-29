//
//  IO.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

protocol PromptDisplayable {
    func displayPrompt(_ prompt: String)
}

protocol InputGettable {
    func getInput() throws -> String
}

protocol OuputDisplayble {
    func displayOutput(_ output: String)
}

protocol RPSErrorDisplayble {
    func displayRPSError(_ error: RPSError)
}

typealias Displayable = PromptDisplayable & OuputDisplayble & RPSErrorDisplayble

typealias IO = InputGettable & Displayable

final class Console: InputGettable {
    func getInput() throws -> String {
        guard let pureInput = readLine() else { throw RPSError.invalidInput }
        let refinedInput = pureInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard refinedInput.isEmpty == false else { throw RPSError.invalidInput }
        return refinedInput
    }
}

extension Console: PromptDisplayable {
    func displayPrompt(_ prompt: String) {
        print(prompt, terminator: " ")
    }
}

extension Console: OuputDisplayble {
    func displayOutput(_ output: String) {
        print(output)
    }
}

extension Console: RPSErrorDisplayble {
    func displayRPSError(_ error: RPSError) {
        print(error.description)
    }
}
