
import Foundation

enum RockPaperScissors: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
    
    var value: Int {
        return rawValue
    }
    
    static var count: Int {
        return RockPaperScissors.allCases.count
    }
    
    static func random() -> RockPaperScissors? {
        return RockPaperScissors.allCases.randomElement()
    }
    
    init?(choiceValue: Int) {
        self.init(rawValue: choiceValue)
    }
}
