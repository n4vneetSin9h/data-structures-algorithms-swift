import Foundation

func findingNemo(_ arr: [String]) {
    let before = Date()
    
    for i in 0..<arr.count {
        if arr[i] == "nemo" {
            print("Found him!")
        }
    }
    
    let after = Date()
    let component = Calendar.current.dateComponents([.nanosecond], from: before, to: after)
    let miliSeconds: Double = Double(component.nanosecond!/1000000)
    print("Finding nemo took: \(miliSeconds)")
}

let nemo = Array<String>(repeating: "", count: 100000)
findingNemo(nemo)


//Constant time O(1)
func constantTime(_ n: Int) -> Int {
    let result = n * n
    return result
}

//Linear Time O(n)
func linearTime(_ A: [Int]) -> Int {
    for i in 0..<A.count {
        if A[i] == 0 {
            return 0
        }
    }
    return 1
}

//Logarithmic time O(log n)
func logarithmicTime(_ N: Int) -> Int {
    var n = N
    var result = 0
    while n > 1 {
        n /= 2
        result += 1
    }
    return result
}

//Quadrtic time O(n^2)
func quadraticTime(_ n: Int) -> Int {
    var result = 0
    for i in 0..<n {
        for j in i..<n {
            result += 1
        }
    }
    return result
}

/*
 Given two arrays, create a function that let's a user know whether these two arrays contain any common items.
 */

//Naive brute force O(n^2)
func commonItemBrute(_ A: [Int], _ B: [Int]) -> Bool {
    for i in 0..<A.count {
        for j in 0..<B.count {
            if A[i] == B[j] {
                return true
            }
        }
    }
    return false
}
commonItemBrute([1, 2, 3], [4, 5, 6])
commonItemBrute([1, 2, 3], [3, 5, 6])

// Convert to hash and lookup via other index
func commonItemHash(_ A: [Int], _ B: [Int]) -> Bool {
    var hashA = [Int: Bool]()
    
    // O(n)
    for a in A {
        hashA[a] = true
    }
    
    // O(n)
    for b in B {
        if hashA[b] == true {
            return true
        }
    }
    return false
}
