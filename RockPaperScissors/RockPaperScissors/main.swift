//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

enum Hand: String, CaseIterable {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

enum GameResult: String {
    case win, draw, lose
}

struct Player {
    var hand: Hand?
    
    mutating func selectRockScissorsPaperHandByInput() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        if let input = readLine() {
            if input == "0" {
                shutDown()
                print("\(power)")
                return
            }
            else {
                self.hand = Hand(rawValue: input)
                if self.hand == nil {
                    print("잘못된 입력입니다. 다시 시도해주세요")
                    selectRockScissorsPaperHandByInput()
                    return
                }
            }
                
        }
    }
    
    mutating func selectRockScissorsPaperHandRandomly() {
        self.hand = Hand.allCases.randomElement()
    }
    
    mutating func selectMukJiPaHandByInput() {
        if let input = readLine() {
            if input == "0" {
                shutDown()
            } else if input == "1" {
                self.hand = .rock
            } else if input == "2" {
                self.hand = .scissors
            } else {
                self.hand = Hand(rawValue: input)
            }
        }
    }
    
    mutating func selectMukJiPaHandRandomly() {
        self.hand = Hand.allCases.randomElement()
    }
}

struct Refree {
    
    func runRockScissorsPaper(playerHand: Hand?,
                              computerHand: Hand?) -> GameResult {
        if (playerHand == computerHand) {
            print("\(playerHand),\(computerHand)")
            return GameResult.draw
        } else if (playerHand == .rock && computerHand == .scissors) ||
                    (playerHand == .scissors && computerHand == .paper) ||
                    (playerHand == .paper && computerHand == .rock) {
            print("\(playerHand),\(computerHand)")

            return GameResult.win
        } else {
            print("\(playerHand),\(computerHand)")

            return GameResult.lose
        }
    }
    
    func noticeRockScissorPaperResult(_ rockScissorsPaperResult: GameResult) {
        switch rockScissorsPaperResult {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("error: 00")
        }
    }
    
    func runMukJiPa(rockScissorsPaperResult: GameResult) {
        var user = Player()
        var computer = Player()
        
        
        if rockScissorsPaperResult == GameResult.win {
            print("[사용자 턴] 묵(1) 찌(2) 빠(3)! <종료 : 0> : ", terminator: "")
        } else if rockScissorsPaperResult == GameResult.lose {
            print("[컴퓨터 턴] 묵(1) 찌(2) 빠(3)! <종료 : 0> : ", terminator: "")
        } else {
            print("error: 02")
            exit(0)
        }
        
        user.selectMukJiPaHandByInput()
        computer.selectMukJiPaHandRandomly()
        
        if user.hand == computer.hand {
            print("\(user.hand),\(computer.hand)")

            judgeMukJiPa(rockScissorsPaperResult)
        } else if (user.hand == .rock && computer.hand == .scissors) ||
                    (user.hand == .scissors && computer.hand == .paper) ||
                    (user.hand == .paper && computer.hand == .rock) {
            print("\(user.hand),\(computer.hand)")

            print("사용자의 턴입니다.")
            runMukJiPa(rockScissorsPaperResult: GameResult.win)
        } else if (user.hand == .scissors && computer.hand == .rock) ||
                    (user.hand == .paper && computer.hand == .scissors) ||
                    (user.hand == .rock && computer.hand == .paper) {
            print("\(user.hand),\(computer.hand)")

            print("컴퓨터의 턴입니다.")
            runMukJiPa(rockScissorsPaperResult: GameResult.lose)
        } else if user.hand == nil {
            print("\(user.hand),\(computer.hand)")

            print("잘못된 입력, 턴이 넘어갑니다.")
            runMukJiPa(rockScissorsPaperResult: GameResult.lose)
        } else {
            shutDown()
        }
        
        func judgeMukJiPa(_ : GameResult) {
            if rockScissorsPaperResult == GameResult.win {
                print("사용자의 승리!")
                shutDown()
            } else {
                print("컴퓨터의 승리...")
                shutDown()
            }
        }
        
    }
}

var power: Bool = true

func shutDown() {
    power.toggle()
}

func startGame() {
    
    let refree = Refree()
    var user = Player()
    var computer = Player()
    
    user.selectRockScissorsPaperHandByInput()
    computer.selectRockScissorsPaperHandRandomly()
    
    let rockScissorPaperResult = refree.runRockScissorsPaper(playerHand: user.hand,
                                                             computerHand: computer.hand)
    
    switch rockScissorPaperResult {
        
    case .draw:
        print("비겼습니다!")
        startGame()
    default:
        refree.noticeRockScissorPaperResult(rockScissorPaperResult)
        refree.runMukJiPa(rockScissorsPaperResult: rockScissorPaperResult)
    }
}

while power {
    startGame()
}
