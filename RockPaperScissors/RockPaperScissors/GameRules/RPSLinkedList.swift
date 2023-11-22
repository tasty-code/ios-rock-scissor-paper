



import Foundation


//MARK: - RPS Node init
final class RpsNode {
    var value: RPSModel
    var next: RpsNode?
    
    init(value: RPSModel) {
        self.value = value
    }
}


//MARK: - CircularRpsLinkedList init
final class CircularRpsLinkedList {
    
    private var startNode: RpsNode?
    
    init() {
        startNode = createRPSLinkedList()
    }
}

//MARK: - CircularRpsLinkedList Method
extension CircularRpsLinkedList {

    
    private func createRPSLinkedList() -> RpsNode {
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
