//
//  ContantCellView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 08.06.2024.
//

import SwiftUI

//TODO: create file for struct Contact
struct Contact: Hashable {
    let id: Int
    let firstName: String
    let lastName: String
    let lastVisit: Date
    let imageName: String?
    let isStory: Bool
    let isOnline: Bool
}

struct ContantCellView: View {
    var contact: Contact
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let imageName = contact.imageName, let url = URL(string: imageName) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        createImageWithOptionalBorder(image: ContactPlaceholderView(firstName: contact.firstName, lastName: contact.lastName))
                    case .success(let image):
                        createImageWithOptionalBorder(image: image.resizable().aspectRatio(contentMode: .fill))
                    case .failure:
                        createImageWithOptionalBorder(image: ContactPlaceholderView(firstName: contact.firstName, lastName: contact.lastName))
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                createImageWithOptionalBorder(image: ContactPlaceholderView(firstName: contact.firstName, lastName: contact.lastName))
            }
            ContactTextInfoView(contact: contact)
        }
        .padding(.top, 16)
        .padding(.bottom, 12)
        .background(Color.wbFontBG2)
    }
    
    @ViewBuilder
    private func createImageWithOptionalBorder<Content: View>(image: Content) -> some View {
        let baseImage = image
            .frame(width: 48, height: 48)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(4)
        
        let borderedImage = baseImage
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [.wbGradientDarkPurple, .wbGradientLightPurple]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
            )
        
        let finalImage = contact.isStory ? AnyView(borderedImage) : AnyView(baseImage)
        
        if contact.isOnline {
            finalImage
                .overlay(
                    Circle()
                        .fill(Color.green)
                        .frame(width: 14, height: 14)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .offset(x: 0, y: -42),
                    alignment: .bottomTrailing
                )
        } else {
            finalImage
        }
    }
}

#Preview {
    ContantCellView(contact: Contact(id: 1,
                                     firstName: "Anna",
                                     lastName: "Lisichkina",
                                     lastVisit: Date(),
                                     imageName: "https://img.freepik.com/free-photo/medium-shot-beautiful-woman-with-braids_23-2151429540.jpg?t=st=1717849084~exp=1717852684~hmac=b6f419253825f431a57cddd0b3935160d5803ff6a0c805a47a1723f0e92c0188&w=740",
                                     isStory: true,
                                     isOnline: true
                                    )
    )
}
