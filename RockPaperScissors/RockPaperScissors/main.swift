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
    let result =  GameIOManager()
    result.handleUserInput(computerPick: randomComputerPick, userChoice: userPick)
}


struct RPS {
    
    
    //가위바위보 로직 구현
    
}

struct MuckCciPpa{
    //묵찌빠 로직구현
}


struct GameIOmaneger {
    
    //유저 인풋값 , 컴퓨터 인풋값을 받아 처리하는 로직 구현
    //RPS , MuckCciPpa 에서 값을 받아와 처리하는 로직을 구현함
    
    
}







