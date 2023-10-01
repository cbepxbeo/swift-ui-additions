/*
 
 Project: SwiftUIAdditions
 File: ActivityIndicator+Rotating.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import SwiftUI

extension ActivityIndicator {
    public init(rotatingDotsCount count: Int = 5) {
        self.option = .rotatingDots(count: count)
    }
}

extension ActivityIndicator {
    struct Rotating: View {
        init(_ count: Int) {
            self.count = count
        }
        let count: Int
        public var body: some View {
            GeometryReader { proxy in
                ForEach(0..<self.count, id: \.self) { index in
                    ActivityIndicator.Rotating.Item(index, proxy.size)
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

extension ActivityIndicator.Rotating {
    struct Item: View {
        init(_ index: Int, _ size: CGSize) {
            self.index = .init(index)
            self.size = size
        }
        @State var scale: CGFloat = 0.0001
        @State var rotation: Double = 0
        let index: CGFloat
        let size: CGSize
  
        var body: some View {
            let animation = Animation
                .timingCurve(0.5, 0.15 + self.index / 5, 0.25, 1, duration: 1.5)
                .repeatForever(autoreverses: false)
            Circle()
                .frame(width: self.size.width / 5, height: self.size.height / 5)
                .scaleEffect(self.scale)
                .offset(y: self.size.width / 10 - self.size.height / 2)
                .rotationEffect(.degrees(self.rotation))
                .onAppear {
                    let newScale = (5 - self.index) / 5
                    self.rotation = 0
                    self.scale = newScale == 0 ? 0.0001 : newScale
                    withAnimation(animation) {
                        let animationScale = (1 + self.index) / 5
                        self.rotation = 360
                        self.scale = animationScale == 0 ? 0.0001 : animationScale
                    }
                }
        }
    }
}
