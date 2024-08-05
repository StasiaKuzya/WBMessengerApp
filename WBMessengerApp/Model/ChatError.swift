//
//  ChatError.swift
//  WBMessengerApp
//
//  Created by Анастасия on 31.07.2024.
//

import Foundation

enum ChatError: Error {
    case unknown(source: Error?)
}
