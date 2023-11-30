import Foundation

var  isGameRunning: Bool = true

while isGameRunning {
    GameIOmanager.showGameMenu(for: .menu)
    guard let randomComputerPick = RockScissorPaperUserOption.allCases.filter({ $0 != .exit }).randomElement() else { continue }
    guard let input = readLine(), let userPick = RockScissorPaperUserOption(rawValue: input) else {
        GameIOmanager.showGameMenu(for: .error)
        continue
    }
    let result =  GameIOmanager()
    result.handleUserInput(computerPick: randomComputerPick, userChoice: userPick)
}
1

