//
//  NetworkManager.swift
//  WBMessengerApp
//
//  Created by Анастасия on 28.07.2024.
//

import Foundation
import Combine
import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case decodingError
    case unknown
}

//TODO: Change when the real backend is ready
final class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = URL(string: "http://example.com/api")!

    private init() {}

    // GET
    func fetchContacts() -> AnyPublisher<[Contact], NetworkError> {
        let url = baseURL.appendingPathComponent("contacts")
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: APIResponse<[Contact]>.self, decoder: JSONDecoder())
            .map(\.data)
            .mapError { _ in NetworkError.requestFailed }
            .eraseToAnyPublisher()
    }

    // POST
    func sendTask(_ task: Task) -> AnyPublisher<Void, NetworkError> {
        let url = baseURL.appendingPathComponent("tasks")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(task)

        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .mapError { _ in NetworkError.requestFailed }
            .map { _ in }
            .eraseToAnyPublisher()
    }

    // PUT
    func updateTask(_ task: Task) -> AnyPublisher<Void, NetworkError> {
        let url = baseURL.appendingPathComponent("tasks/\(task.id.uuidString)")
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(task)

        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .mapError { _ in NetworkError.requestFailed }
            .map { _ in }
            .eraseToAnyPublisher()
    }

    // DELETE
    func deleteTask(id: UUID) -> AnyPublisher<Void, NetworkError> {
        let url = baseURL.appendingPathComponent("tasks/\(id.uuidString)")
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .mapError { _ in NetworkError.requestFailed }
            .map { _ in }
            .eraseToAnyPublisher()
    }
}
