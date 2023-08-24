/*
 
 Project: SwiftUIAdditions
 File: RoundedShape.swift
 Created by: Егор Бойко
 Date: 24.08.2023
 
 Status: #Complete | #Not decorated
 
 */


import SwiftUI

public struct RoundedShape: View {
    public init(style: Self.Style = .rectangle, color: Color = .black) {
        self.style = style
        self.color = color
    }
    
    var style: Self.Style
    var color: Color
    
    public var body: some View {
        GeometryReader{
            RoundedRectangle(
                cornerRadius: $0.size.width / style.divisor,
                style: .continuous
            )
            .fill(self.color)
        }
    }
}
