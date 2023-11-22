



import Foundation


//MARK: - RPS Node init
class RpsNode {
    var value: RPSModel
    var next: RpsNode?
    
    init(value: RPSModel) {
        self.value = value
    }
}


//MARK: - CircularRpsLinkedList init
class CircularRpsLinkedList {
    
    private var startNode: RpsNode?
    
    init() {
        startNode = createRPSLinkedList()
    }
}

//MARK: - CircularRpsLinkedList Method
extension CircularRpsLinkedList {
    
    func convertInputToRPSOption(_ input: String) -> RPSModel? {
        switch input {
        case "1", "가위":
            return .scissors
        case "2", "바위":
            return .rock
        case "3", "보":
            return .paper
        default:
            return nil
        }
    }

    
    func createRPSLinkedList() -> RpsNode {
        let rock = RpsNode(value: .rock)
        let paper = RpsNode(value: .paper)
        let scissors = RpsNode(value: .scissors)
        
        rock.next = paper
        paper.next = scissors
        scissors.next = rock

        return rock
    }
        
    func node(for choice: RPSModel) -> RpsNode? {
        var currentNode = startNode
        repeat {
            if currentNode?.value == choice {
                return currentNode
            }
            currentNode = currentNode?.next
        } while currentNode !== startNode

        return nil
    }
}
