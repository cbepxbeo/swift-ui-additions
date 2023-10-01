/*
 
 Project: SwiftUIAdditions
 File: ActivityIndicator+Default.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import SwiftUI

extension ActivityIndicator {
    public init(count: Int = 8) {
        self.option = .default(count: count)
    }
}

extension ActivityIndicator {
    struct Default: View {
        init(_ count: Int) {
            self.count = count
        }
        let count: Int
        public var body: some View {
            GeometryReader { proxy in
                ForEach(0..<self.count, id: \.self) { index in
                    ActivityIndicator.Default.Item(index, self.count, proxy.size)
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

extension ActivityIndicator.Default {
    struct Item: View {
        init(_ index: Int, _ count: Int, _ size: CGSize) {
            self.index = .init(index)
            self.count = .init(count)
            self.size = size
        }
        @State var opacity: CGFloat = 0
        let index: CGFloat
        let count: CGFloat
        let size: CGSize
   
        var body: some View {
            let height = self.size.height / 3.2
            let width = height / 2
            let angle = 2 * .pi / self.count * self.index
            let x = (self.size.width / 2 - height / 2) * cos(angle)
            let y = (self.size.height / 2 - height / 2) * sin(angle)
            let delay = self.index / self.count / 2

            let animation = Animation.default
                .repeatForever(autoreverses: true)
                .delay(delay)

            RoundedRectangle(cornerRadius: width / 2 + 1)
                .frame(width: width, height: height)
                .rotationEffect(Angle(radians: Double(angle + CGFloat.pi / 2)))
                .offset(x: x, y: y)
                .opacity(self.opacity)
                .onAppear {
                    self.opacity = 1
                    withAnimation(animation) {
                        self.opacity = 0.3
                    }
                }
        }
    }
}
