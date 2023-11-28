import Foundation

struct User: Player {
    func chooseOption() -> Option {
        return InputHandler.receiveInput()
    }
}
