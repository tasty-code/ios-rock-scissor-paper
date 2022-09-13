import Foundation

func rock(_ computerNumber: Int) {
    if computerNumber == 1 {
        print("이겼습니다")
    }
    else if computerNumber == 2 {
        print("비겼습니다")
    }
    else if computerNumber == 3 {
        print("졌습니다")
    }
}

func paper(_ computerNumber: Int) {
    if computerNumber == 1 {
        print("졌습니다")
    }
    else if computerNumber == 2 {
        print("이겼습니다")
    }
    else if computerNumber == 3 {
        print("비겼습니다")
    }
}

func scissors(_ computerNumber: Int) {
    if computerNumber == 1 {
        print("비겼습니다")
    }
    else if computerNumber == 2 {
        print("졌습니다")
    }
    else if computerNumber == 3 {
        print("이겼습니다")
    }
}

func gameStart() {
    var userNumber: Int
    var computerNumber: Int
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        userNumber = Int(readLine()!)!
        computerNumber = Int.random(in: 1...3)
        
        if userNumber == 0 {
            print("//게임 종료, 출력문은 없습니다")
            break
        }
        else if userNumber == 1 {
            scissors(computerNumber)
        }
        else if userNumber == 2 {
            rock(computerNumber)
        }
        else if userNumber == 3 {
            paper(computerNumber)
        }
        else {
            print("잘못된 입력입니다. 다시 시도해주세요")
            
        }
        
    }
    
}

gameStart()
