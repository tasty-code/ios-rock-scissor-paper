
import Foundation

//MARK: - RPSModel
enum RPSModel: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum GameComment: String {
    case rps = "가위(1), 바위(2), 보(3) ! <종료: 0> : "
    case mookJjiBba = "묵(1), 찌(2), 빠(3) ! <종료: 0> : "
}
