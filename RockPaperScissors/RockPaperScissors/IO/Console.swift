//
//  Console.swift
//  RockPaperScissors
//
//  Created by Effie on 11/29/23.
//

import Foundation

struct Console { }

extension Console: InputGettable {
    func getInput() throws -> String {
        guard let pureInput = readLine() else { throw HandGameError.invalidInput }
        let refinedInput = pureInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard refinedInput.isEmpty == false else { throw HandGameError.invalidInput }
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

extension Console: HandGameErrorDisplayble {
    func displayRPSError(_ error: HandGameError) {
        print(error.description)
    }
}
