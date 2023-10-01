/*
 
 Project: SwiftUIAdditions
 File: UnilateralRoundedRectangle.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import SwiftUI
import SwiftUIExtension

public struct UnilateralRoundedShape: View {

    public init(cornerRadius: CGFloat) {
        self.color = .black
        self.style = .custom(cornerRadius)
        self.disabledAngle = .init()
    }
    
    public init(style: RoundedShape.Style) {
        self.color = .black
        self.style = style
        self.disabledAngle = .init()
    }
    
    var color: Color
    var style: RoundedShape.Style
    var disabledAngle: Set<UnilateralRoundedShape.Angle>
    
    public var body: some View {
        Rectangle()
            .fill(self.color)
            .mask(
                GeometryReader{ proxy in
                    ZStack{
                        ForEach(self.disabledAngle.map{$0}){ item in
                            Rectangle()
                                .frame(
                                    width: proxy.size.width / 2,
                                    height: proxy.size.height / 2
                                )
                                .pushedInsideStack(item.alignment)
                        }
                        RoundedShape(style: self.style)
                    }
                }
            )
    }
}
