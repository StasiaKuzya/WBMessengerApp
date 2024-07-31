//
//  PersonalChatView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 09.06.2024.
//

import SwiftUI
import Foundation
import ExyteChat

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let sender: String
    let timestamp: Date
}

struct PersonalChatView: View {
//    @State private var messages: [Message] = []
    
    //MockData
    @State private var messages: [Message] = [
        Message(text: "Hi", sender: "You", timestamp: Date()),
        Message(text: "TestTestTestTestTestTestTestTestTestTestTestTest", sender: "You", timestamp: Date()+60),
        Message(text: "Hi", sender: "Tom", timestamp: Date()+65),
        Message(text: "How are you", sender: "You", timestamp: Date()+120),
        Message(text: "TestTestTestTestTestTestTestTestTestTestTestTest", sender: "Tom", timestamp: Date()+180),
        Message(text: "TestTestTestTestTestTestTestTest", sender: "Tom", timestamp: Date()+180),
    ]
    
    @State private var messageText: String = ""
    
    var body: some View {
        ZStack {
            Color.wbFontBG2.ignoresSafeArea()
            VStack {
                List(messages) { message in
                    if message.sender == "You" {
                        HStack() {
                            Spacer()
                            SentMessageView(message: message)
                        }
                        .listRowBackground(Color.wbFontBG)
                        .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                        .listRowSeparator(.hidden)
                    } else {
                        HStack() {
                            RecievedMessageView(message: message)
                            Spacer()
                        }
                        .listRowBackground(Color.wbFontBG)
                        .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .background(Color.wbFontBG)
                
                HStack {
                    Button {
                        // TODO: open and chose from gallery
                    } label: {
                        Image("plus")
                    }
                    
                    TextField("",
                              text: $messageText,
                              prompt: Text("Message"))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 8)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.wbFontBG))
                    .foregroundStyle(.wbFont)
                    
                    Button {
                        sendMessage()
                    } label: {
                        Image("send")
                    }
                    .disabled(messageText.isEmpty)
                }
                .padding()
            }
            .onAppear {
                loadMessages()
            }
            .padding(.top, 1)
        }
    }

    func sendMessage() {
        let newMessage = Message(text: messageText, sender: "You", timestamp: Date())
        messages.append(newMessage)
        messageText = ""
        // TODO: send messages on server
    }
    
    func loadMessages() {
        // TODO: load messages from server or local storage
    }
}

#Preview {
    PersonalChatView()
}
