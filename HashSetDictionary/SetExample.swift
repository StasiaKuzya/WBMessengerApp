//
//  SetExample.swift
//  WBMessengerApp
//
//  Created by Анастасия on 11.07.2024.
//

import Foundation

// 3
final class SetExample {
    // create Set
    private var numbersSet: Set<Int> = [1, 2, 3, 4, 5]
    
    // add elements to Set
    private func insert() {
        numbersSet.insert(6)
        numbersSet.insert(7)
    }
    
    // remove element from Set
    private func removeElement() {
        numbersSet.remove(3)
    }
    
    // check element is in Set
    private func check() {
        let containsFour = numbersSet.contains(4)
        print("Set contains 4: \(containsFour)")
    }
    
    // unite Sets, intersect Sets, substract Sets and print
    private func uniteIntersectSubtract() {
        let anotherSet: Set<Int> = [4, 5, 6, 7, 8, 9]
        let unionSet = numbersSet.union(anotherSet)
        let intersectionSet = numbersSet.intersection(anotherSet)
        let differenceSet = numbersSet.subtracting(anotherSet)
        
        print("Union: \(unionSet)")
        print("Intersection: \(intersectionSet)")
        print("Difference: \(differenceSet)")
    }
}
