//
//  CustomHashFunc.swift
//  WBMessengerApp
//
//  Created by Анастасия on 11.07.2024.
//

import Foundation

// 2
func customHashFunction(string: String) -> Int {
    let prime = 31
    var hash = 0
    for char in string {
        hash = prime &* hash &+ Int(char.asciiValue ?? 0)
    }
    return hash
}
