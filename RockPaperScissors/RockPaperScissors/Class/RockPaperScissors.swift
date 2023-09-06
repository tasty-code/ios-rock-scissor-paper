//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by Swain Yun on 2023/09/06.
//

import Foundation

final class RockPaperScissors {
    private var computerHandSign: Order? = nil
    
    func run() {
        do {
            let userOrder = try inputUserOrder()
            calculateResult(userOrder: userOrder)
        } catch {
            print(error)
            run()
        }
    }
    
    private func inputUserOrder() throws -> Order {
        computerHandSign = makeComputerHandSign()
        print(InterfaceScript.Menu.userInput.description, terminator: "")
        
        guard let input = readLine(),
              let intInput = Int(input),
              let order = Order(rawValue: intInput)
        else { throw InterfaceScript.Failure.wrongInput }
        
        return order
    }
    
    private func makeComputerHandSign() -> Order? {
        guard let computer = Order.allCases.filter({ $0 != .exitProgram }).randomElement() else { return nil }
        
        print("컴퓨터: \(computer.rawValue)")
        
        return computer
    }
    
    private func calculateResult(userOrder: Order) {
        guard let computer = computerHandSign?.rawValue else { return }
        let distance = computer - userOrder.rawValue
        
        switch distance {
        case -1, 2:
            print(InterfaceScript.GameResult.win)
            return
        case -2, 1:
            print(InterfaceScript.GameResult.lose)
            return
        default:
            print(InterfaceScript.GameResult.draw)
            run()
        }
    }
}
