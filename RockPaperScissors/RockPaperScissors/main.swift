import Foundation





var isGameRunning: Bool = true

while isGameRunning {
    GameIOmanager.showGameMenu(for: .menu)
    guard let randomComChoice = UserMenuOption.allCases.randomElement() else { continue }
    guard let input = readLine(), let userPick = UserMenuOption(rawValue: input) else {
        GameIOmanager.showGameMenu(for: .error)
        continue
    }
    let result =  GameIOmanager()
    result.handleUserInput(comPick: randomComChoice, userPick: userPick)
}





