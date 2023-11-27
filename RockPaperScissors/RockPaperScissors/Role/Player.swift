import Foundation

protocol Player {
    var willEndGame: Bool { get }
    mutating func chooseSymbol() -> RockPaperScissors?
}
