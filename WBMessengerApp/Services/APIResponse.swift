//
//  APIResponse.swift
//  WBMessengerApp
//
//  Created by Анастасия on 28.07.2024.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let data: T
    let status: String
}
