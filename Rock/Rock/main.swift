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
