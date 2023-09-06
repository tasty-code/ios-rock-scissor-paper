//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Swain Yun on 2023/09/06.
//

import Foundation

final class RockPaperScissors {
    private var computerHandSign: Order?
    
    init() {
        computerHandSign = makeComputerHandSign()
    }
    
    private func makeComputerHandSign() -> Order? {
        guard let computer = Order.allCases.filter({$0 != .exitProgram }).randomElement() else { return nil }
        
        return computer
    }
    
//    func inputOrder() throws -> Order {
//        guard
//            let input = readLine(),
//            let intInput = Int(input),
//            let order = Order(rawValue: intInput)
//        else { throw }
//
//        return order
//    }
}
