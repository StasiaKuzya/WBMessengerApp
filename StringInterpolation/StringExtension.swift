//
//  StringExtension.swift
//  WBMessengerApp
//
//  Created by Анастасия on 24.06.2024.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "")
    }
    
    func dictionaryFromLocalizedStrings() -> [AnyHashable: Any]? {
        guard let data = data(using: .utf8) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [AnyHashable: Any]
    }
}
