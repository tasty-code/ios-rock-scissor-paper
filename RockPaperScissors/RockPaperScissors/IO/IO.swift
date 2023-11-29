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

protocol HandGameErrorDisplayble {
    func displayRPSError(_ error: HandGameError)
}

typealias IO = InputGettable & PromptDisplayable & OuputDisplayble & HandGameErrorDisplayble
