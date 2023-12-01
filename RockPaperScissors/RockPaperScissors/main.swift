import Foundation

var  isGameRunning: Bool = true

while isGameRunning {
    GameIOManager.showGameMenu(for: .menu)
    guard let randomComputerPick = RockScissorPaperUserOption.allCases.filter({ $0 != .exit }).randomElement() else { continue }
    guard
        let input = readLine(),
        let userInput = Int(input),
        let userPick = (RockScissorPaperUserOption(rawValue: userInput))
    else {
        GameIOManager.showGameMenu(for: .error)
        continue
    }
    let gameIOManager =  GameIOManager()
    gameIOManager.handleUserInput(computerPick: randomComputerPick, userChoice: userPick)
}








