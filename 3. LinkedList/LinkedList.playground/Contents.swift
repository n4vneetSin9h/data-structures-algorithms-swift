import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkList {
    private var head: Node?
        
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }

    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        return head!.data
    }

    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        node.next = newNode
    }

    func getLast() -> Int? {
        if head == nil {
            return nil
        }
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        return node.data
    }

    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head
        
        for _ in 0..<position-1 {
            if currentNode?.next == nil {
                return
            }
            currentNode = currentNode?.next!
        }
        
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    func deleteFirst() {
        head = head?.next
    }

    func deleteLast() {
        if head == nil {
            return
        }
        
        var node = head!
        var prevNode = head!
        
        while node.next != nil {
            prevNode = node
            node = node.next!
        }
        
        prevNode.next = nil
        
    }
    
    func delete(at position: Int) {
        if position == 0 {
            deleteFirst()
            return
        }
        
        var currentNode = head
        
        for _ in 0..<position-1 {
            if currentNode?.next == nil {
                return
            }
            currentNode = currentNode?.next!
        }
        
        currentNode?.next = currentNode?.next?.next
        
    }
    
    func item(at position: Int) -> Int? {
        if position == 0 {
            return head?.data
        }
        
        var currentNode = head
        
        for _ in 0..<position-1 {
            if currentNode?.next == nil {
                return nil
            }
            currentNode = currentNode?.next!
        }
        
        return currentNode?.data
        
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var length: Int {
        if head == nil { return 0 }
        
        var count = 1
        var node = head
        
        while node?.next != nil {
            node = node?.next
            count += 1
        }
        return count
    }
    
    func clear() {
        head = nil
    }
    
    func printLinkedList() {
        if head == nil { return }
        
        var result = [Int]()
        var node = head
        result.append(node!.data)
        
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
        
        print(result)
    }
}
