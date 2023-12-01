import Foundation

var gameManager = GameManager()

while(gameManager.isGameActive) {
    gameManager.playGame()
}
