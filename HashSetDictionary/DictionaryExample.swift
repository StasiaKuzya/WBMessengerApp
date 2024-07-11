//
//  DictionaryExample.swift
//  WBMessengerApp
//
//  Created by Анастасия on 11.07.2024.
//

import Foundation

// 4
final class DictionaryExample {
    // create dictionary
    private var cityPopulation: [String: Int] = [
        "Moscow": 200,
        "Saint-Petersburg": 100,
        "Kaliningrad": 50
    ]
    
    // add elements to dictionary
    private func addElements() {
        cityPopulation["Samara"] = 70
        cityPopulation["Saratov"] = 40
    }
    
    // remove element from dictionary
    private func removeElement() {
        cityPopulation.removeValue(forKey: "Kaliningrad")
    }
    
    // change element info
    private func changeInfo() {
        cityPopulation["Moscow"] = 220
    }
    
    // print element value
    private func printElementValue() {
        if let population = cityPopulation["Saint-Petersburg"] {
            print("Population of Saint-Petersburg: \(population)")
        }
        
        print("Updated city population dictionary: \(cityPopulation)")
    }
}
