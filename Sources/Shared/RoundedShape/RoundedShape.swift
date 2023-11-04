/*
 
 Project: SwiftUIAdditions
 File: RoundedShape.swift
 Created by: Egor Boyko
 Date: 24.08.2023
 
 Status: #Complete | #Not decorated
 
 */


import SwiftUI

public struct RoundedShape: View {
    public init(style: Self.Style = .rectangle) {
        self.style = style
        self.color = .black
    }
    
    public init(cornerRadius: CGFloat) {
        self.style = .custom(cornerRadius)
        self.color = .black
    }
    
    var style: Self.Style
    var color: Color
    
    func cornerRadius(size: CGSize) -> CGFloat {
        switch self.style {
        case .custom(let radius):
            radius
        default:
            size.width / self.style.divisor
        }
    }
    
    public var body: some View {
        GeometryReader{
            RoundedRectangle(
                cornerRadius: self.cornerRadius(size: $0.size),
                style: .continuous
            )
            .fill(self.color)
        }
    }
}
