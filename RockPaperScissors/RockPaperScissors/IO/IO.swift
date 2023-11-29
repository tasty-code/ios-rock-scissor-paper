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
