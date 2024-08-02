//
//  APIClient.swift
//  WBMessengerApp
//
//  Created by Анастасия on 28.07.2024.
//

import Foundation
import Combine

struct TaskMock: Codable {
    let id: UUID
    let data: String
    let taskType: String
}

final class APIClient {
    func fetchContacts() -> AnyPublisher<[Contact], NetworkError> {
        return NetworkManager.shared.fetchContacts()
    }

    func sendTask(_ task: TaskMock) -> AnyPublisher<Void, NetworkError> {
        return NetworkManager.shared.sendTask(task)
    }
}
