//
//  GameController.swift
//  RockPaperScissors
//
//  Created by Minho on 11/28/23.
//

class GameController {
    
    static let shared: GameController = GameController()
    
    private var _players: [Player] = []
    private var _user: Player
    private var _opponent: Player
    
    private var _rpsGame: RockPaperScissorsGameModel
    private var _mjbGame: MukJjiPpaGameModel
    private var _gameState: GameState = .rpsGame
    
    init() {
        for _ in 0...1 {
            _players.append(Player(input: .noChoice, isMyTurn: true))
        }
        _user = _players[0]
        _opponent = _players[1]
        
        _rpsGame = RockPaperScissorsGameModel(players: _players)
        _mjbGame = MukJjiPpaGameModel(rpsGame: _rpsGame)
    }
    
    var gameState: GameState {
        get {
            return _gameState
        }
    }
    
    func playGame() {
        guard _gameState != .gameOver else { return }
        
        printMenuMessage()
        
        switch _gameState {
        case .gameOver:
            _gameState = .gameOver
        case .rpsGame:
            _user.input = readInput()
            _opponent.input = makeRandomRockScissorPaperInput() // MARK: input 받는 부분, 컴퓨터 리셋 부분 겹침. 수정 필요
            _gameState = _rpsGame.playGame()
        case .mjbGame:
            _user.input = readInput()
            _opponent.input = makeRandomRockScissorPaperInput()
            _gameState = _mjbGame.playGame()
        }
    }
    
    func readInput() -> RockPaperScissor {
        if let input = Int(readLine() ?? "") {
            return _rpsGame.convertInputToRockPaperScissor(input, _gameState)
        } else {
            return .noChoice
        }
    }
    
    func printMenuMessage() {
        switch _gameState {
        case .gameOver:
            print("게임 종료")
        case .rpsGame:
            print(MenuMessage.rps, terminator: "")
        case .mjbGame:
            let playerName: String = _user.isMyTurn == true ? "사용자" : "컴퓨터"
            print("[\(playerName)의 턴] \(MenuMessage.mjb)", terminator: "")
        }
    }
    
    func makeRandomRockScissorPaperInput() -> RockPaperScissor {
        let randomInput = Int.random(in: 1...3)
        return _rpsGame.convertInputToRockPaperScissor(randomInput, _gameState)
    }
}
