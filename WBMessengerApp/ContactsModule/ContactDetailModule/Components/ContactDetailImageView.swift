//
//  ContactDetailImageView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 10.06.2024.
//

import SwiftUI
struct ContactDetailImageView: View {
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            profileImageView()
            addButton()
                .offset(x: -6, y: 0)
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
    
    @ViewBuilder
    private func profileImageView() -> some View {
        if let selectedImage = selectedImage {
            Image(uiImage: selectedImage)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .background(
                    Circle()
                        .fill(.wbFontBG)
                        .frame(width: 100, height: 100)
                )
        } else {
            Image("contactImage")
                .renderingMode(.template)
                .frame(width: 100, height: 100)
                .foregroundStyle(.wbFont)
                .background(
                    Circle()
                        .fill(.wbFontBG)
                        .frame(width: 100, height: 100)
                )
        }
    }
    
    private func addButton() -> some View {
        Button(action: {
            showingImagePicker = true
        }) {
            Text("+")
                .bold()
                .foregroundColor(.wbFontBG)
                .background(
                    Circle()
                        .fill(.wbFont)
                        .frame(width: 24, height: 24)
                )
        }
    }
}

#Preview {
    ContactDetailImageView()
}
