/*
 
 Project: SwiftUIAdditions
 File: TransformSlider.swift
 Created by: Egor Boyko
 Date: 20.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

public struct TransformSlider<A, Content: View>: View {
    @StateObject var viewModel: TransformSliderViewModel = .init()
    
    let array: [A]
    let content: (Int, CGFloat) -> Content
    
    public init(_ array: [A], @ViewBuilder content: @escaping (_ index: Int, _ degrees: CGFloat) -> Content) {
        self.content = content
        self.array = array
    }
}
