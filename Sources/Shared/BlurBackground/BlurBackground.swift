/*
 
 Project: SwiftUIAdditions
 File: BlurBackground.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Completed | #Not decorated
 
 */

import SwiftUI

public struct BlurBackground: UIViewRepresentable {

    private var style: UIBlurEffect.Style
    
    public init(_ style: UIBlurEffect.Style) {
        self.style = style
    }
    
    public func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: self.style))
        return view
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
