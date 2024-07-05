//
//  AnimatedProgressView.swift
//  WBMessengerApp
//
//  Created by Анастасия on 05.07.2024.
//

import SwiftUI

struct AnimatedProgressView: View {
    @State private var animateGradient = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                Color.wbMainBG,
                .wbDefaultPurple,
                Color.wbMainBG
            ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                .ignoresSafeArea(.all)
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .wbDarkPurple,
                            .wbDefaultPurple,
                            .wbLightPurple,
                            .wbGradientLightBlue,
                            .wbGradientDarkBlue
                        ]),
                        startPoint: animateGradient ? .leading : .trailing,
                        endPoint: animateGradient ? .trailing : .leading
                    )
                )
                .animation(Animation.linear(duration: 3).repeatForever(autoreverses: true), value: animateGradient)
                .onAppear {
                    animateGradient = true
                }
                .mask(
                    ProgressView()
                        .scaleEffect(3)
                        .rotationEffect(.degrees(animateGradient ? 360 : 0))
                        .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: animateGradient)
                )
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    AnimatedProgressView()
}
