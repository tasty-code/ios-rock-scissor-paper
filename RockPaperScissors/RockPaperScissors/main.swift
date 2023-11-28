import Foundation

// MARK: - 가위바위보

func endGame() {
    isWorking = false
    print("게임종료")
}

func displayStartMessage() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

//함수명 변경 startGmae -> calculateResult
func calculateResult(comInput: ChoiceMenu, userInput: ChoiceMenu) -> Result {
    if userInput == comInput {
        return .draw
    } else if userInput == .exit {
        return .quitGame
    } else if (comInput == .scissor && userInput == .rock) ||
                (comInput == .rock && userInput == .paper) ||
                (comInput == .paper && userInput == .scissor) {
        return .win
    } else {
        return .lose
    }
}

var isWorking: Bool = true

while isWorking {
    displayStartMessage()
    
    if let userInput = readLine(), let userPick = ChoiceMenu(rawValue: userInput) {
        guard let comPick = ChoiceMenu.allCases.filter({ $0 != .exit }).randomElement() else { continue }
        
        //결과값 받는 메서드 추가
        let result: Result = calculateResult(comInput: comPick, userInput: userPick)
        print(result.rawValue)
        
        
        if result == .win || result == .lose {
            playMukccippa()
            
        } else if result == .quitGame {
            isWorking = false
        } else if result == .draw {
            continue
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}



// MARK: - 묵찌빠

//var player:Bool = true
////var turn: String = player == true ? "사용자" : "컴퓨터"


//func displaymukjjippaGameMessage(forTurn: String) {
//    print("[\(forTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :")
//}
//
//let isplayerTurn = true
//
//func vicmessage(player: String) {
//    print("\(player)의 승리")
//}
//
//var mukccippaGame: Bool = false


//func playMukccippa() {
//    
//    let turn = isplayerTurn ? "사용자턴" : "플레이어턴"
//    
//    displaymukjjippaGameMessage(forTurn: turn)
//    
//    while true {
//        
//        if let userInput = readLine(), let userPick = ChoiceMenu(rawValue: userInput) {
//            guard let comPick = ChoiceMenu.allCases.filter({ $0 != .exit }).randomElement() else { continue }
//            let result: Result = calculateResult(comInput: comPick, userInput: userPick)
//            print(result.rawValue)
//            
//            if result == .draw && isplayerTurn == true {
//                print("[사용자]가 이겼습니다.")
//            }
//        }
//    }
//}


class MukJjiPpaGame {
    var isWorking = true
    var isPlayerTurn = true
    
    func displayMukjjippaGameMessage(turn: String) {
        print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :")
    }
    
    func resultCalculate(userInput: Int, comInput: Int) -> Result {
        
    }
}
