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
        @State var isAppear: Bool = false
        let count: Int
        public var body: some View {
            VStack{
                GeometryReader { proxy in
                    ForEach(0..<self.count, id: \.self) { index in
                        ActivityIndicator.Rotating.Item(index, .init(width: 30, height: 30), isAppear: isAppear)
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                }
                .onAppear{
                    self.isAppear = true
                }
            }
            .frame(width: 30, height: 30)
        }
    }
}

extension ActivityIndicator.Rotating {
    struct Item: View {
        init(_ index: Int, _ size: CGSize, isAppear: Bool) {
            self.index = .init(index)
            self.size = size
            self.isAppear = isAppear
        }
        
        let isAppear: Bool
        let index: CGFloat
        let size: CGSize
        
        var rotation: CGFloat {
            self.isAppear ? 360 : 0
        }
        
        var scale: CGFloat {
            isAppear ?  nearZero((1 + index) / 5) : nearZero((5 - index) / 5)
        }
        
        func nearZero(_ value: CGFloat) -> CGFloat {
            value == 0 ? 0.0001 : value
        }
  
        var body: some View {
            let animation = Animation
                .timingCurve(0.5, 0.15 + self.index / 5, 0.25, 1, duration: 1.5)
                .repeatForever(autoreverses: false)
            ZStack{
                Circle()
                    .ignoresSafeArea()
                    .frame(width: self.size.width / 5, height: self.size.height / 5)
                    .scaleEffect(self.scale)
                    .offset(y: self.size.width / 10 - self.size.height / 2)
                    .rotationEffect(.degrees(self.rotation))
                    .animation(animation, value: self.isAppear)
            }
            .frame(width: self.size.width, height: self.size.height)
        }
    }
}
