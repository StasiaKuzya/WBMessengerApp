//
//  DataManager.swift
//  WBMessengerApp
//
//  Created by Анастасия on 14.06.2024.
//

import Foundation
import WidgetKit

class DataManager {
    static let shared = DataManager()
    let userDefaults = UserDefaults(suiteName: "group.com.mymessenger")
    
    private init() {}

    func saveContactCount(_ count: Int) {
        userDefaults?.set(count, forKey: "contactCount")
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    func loadContactCount() -> Int {
        return userDefaults?.integer(forKey: "contactCount") ?? 0
    }
    
    func saveLastExitDate(_ date: Date) {
        userDefaults?.set(date, forKey: "lastExitDate")
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    func loadLastExitDate() -> Date? {
        return userDefaults?.object(forKey: "lastExitDate") as? Date
    }
}
