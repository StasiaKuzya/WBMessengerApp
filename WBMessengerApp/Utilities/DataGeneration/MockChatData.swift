//
//  MockChatData.swift
//  ChatTest
//
//  Created by Анастасия on 31.07.2024.
//

import Foundation
import UIKit
import ExyteChat
import ExyteMediaPicker

final class MockChatData {
    
    // John is user
    let john =  MockUser(id: "1", firstName: "John", lastName: "Doe", lastVisit: Date(), imageName: nil, isStory: false, isOnline: false)
    let jane =  MockUser(id: "2", firstName: "Jane", lastName: "Smith", lastVisit: Date(), imageName: nil, isStory: false, isOnline: true)
    let janetta =  MockUser(id: "3", firstName: "Janetta", lastName: "Tsmithova", lastVisit: Date(), imageName: nil, isStory: true, isOnline: false)
    let alice =  MockUser(id: "4", firstName: "Alice", lastName: "Johnson", lastVisit: Date(), imageName: nil, isStory: true, isOnline: true)
    let alex =  MockUser(id: "5", firstName: "Alex", lastName: "John", lastVisit: Date(), imageName: "https://kartinki.pics/uploads/posts/2022-05/1652216537_3-kartinkin-net-p-rik-i-morti-kartinki-na-avu-3.jpg", isStory: false, isOnline: false)


    func randomMessage(senders: [MockUser] = [], date: Date? = nil) -> MockMessage {
        let senders = senders.isEmpty ? [john, jane, janetta, alice, alex] : senders
        let sender = senders.random()!
        let date = date ?? Date()
        let images = randomImages()

        let shouldGenerateText = images.isEmpty ? true : .random()

        return MockMessage(
            uid: UUID().uuidString,
            sender: sender,
            createdAt: date,
            status: sender.isCurrentUser ? .read : nil,
            text: shouldGenerateText ? Lorem.sentence(nbWords: Int.random(in: 3...10), useMarkdown: true) : "",
            images: images,
            videos: [],
            recording: nil,
            replyMessage: nil
        )
    }

    func randomImages() -> [MockImage] {
        guard Int.random(min: 0, max: 10) == 0 else {
            return []
        }

        let count = Int.random(min: 1, max: 5)
        return (0...count).map { _ in
            randomMockImage()
        }
    }

    func randomMockImage() -> MockImage {
        let color = randomColorHex()
        return MockImage(
            id: UUID().uuidString,
            thumbnail: URL(string: "https://via.placeholder.com/150/\(color)")!,
            full: URL(string: "https://via.placeholder.com/600/\(color)")!
        )
    }

    func randomColorHex() -> String {
        (0...6)
            .map { _ in randomHexChar() }
            .joined()
    }
}

private extension MockChatData {
    func randomHexChar() -> String {
        let letters = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
        return letters.random()!
    }
}

class AssetExtractor {

    static func createLocalUrl(forImageNamed name: String) -> URL? {

        let fileManager = FileManager.default
        let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let url = cacheDirectory.appendingPathComponent("\(name).pdf")

        guard fileManager.fileExists(atPath: url.path) else {
            guard
                let image = UIImage(named: name),
                let data = image.pngData()
            else { return nil }

            fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
            return url
        }

        return url
    }
}

extension DraftMessage {
    func makeMockImages() async -> [MockImage] {
        await medias
            .filter { $0.type == .image }
            .asyncMap { (media : Media) -> (Media, URL?, URL?) in
                (media, await media.getThumbnailURL(), await media.getURL())
            }
            .filter { (media: Media, thumb: URL?, full: URL?) -> Bool in
                thumb != nil && full != nil
            }
            .map { media, thumb, full in
                MockImage(id: media.id.uuidString, thumbnail: thumb!, full: full!)
            }
    }

    func makeMockVideos() async -> [MockVideo] {
        await medias
            .filter { $0.type == .video }
            .asyncMap { (media : Media) -> (Media, URL?, URL?) in
                (media, await media.getThumbnailURL(), await media.getURL())
            }
            .filter { (media: Media, thumb: URL?, full: URL?) -> Bool in
                thumb != nil && full != nil
            }
            .map { media, thumb, full in
                MockVideo(id: media.id.uuidString, thumbnail: thumb!, full: full!)
            }
    }

    func toMockMessage(user: MockUser, status: Message.Status = .read) async -> MockMessage {
        MockMessage(
            uid: id ?? UUID().uuidString,
            sender: user,
            createdAt: createdAt,
            status: user.isCurrentUser ? status : nil,
            text: text,
            images: await makeMockImages(),
            videos: await makeMockVideos(),
            recording: recording,
            replyMessage: replyMessage
        )
    }
    
    func toMockMessage2(user: MockUser, status: Message.Status = .read, replyMessage: ReplyMessage?) async -> MockMessage {
        MockMessage(
            uid: id ?? UUID().uuidString,
            sender: user,
            createdAt: createdAt,
            status: user.isCurrentUser ? status : nil,
            text: text,
            images: await makeMockImages(),
            videos: await makeMockVideos(),
            recording: recording,
            replyMessage: replyMessage
        )
    }
}
