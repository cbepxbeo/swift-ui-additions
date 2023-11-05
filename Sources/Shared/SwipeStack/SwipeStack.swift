/*
 
 Project: SwiftUIAdditions
 File: SwipeStack.swift
 Created by: Egor Boyko
 Date: 05.11.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI
import SwiftUIExtension

public struct SwipeStack<Content: View>: View  {
    public init(distance: CGFloat = 50, @ViewBuilder content: @escaping () -> Content) {
        self.distance = distance
        self.content = content
    }
    
    @State private var drag: SwipeModifier.Direction? = nil
    var swipeLeftAction: (() -> ())? = nil
    var swipeRightAction: (() -> ())? = nil
    var swipeDownAction: (() -> ())? = nil
    var swipeUpAction: (() -> ())? = nil
    let distance: CGFloat
    let content: () -> Content
    
    public func swipeAction(_ direction: SwipeModifier.Direction, action: @escaping () -> ()) -> Self {
        var output = self
        switch direction {
        case .left:
            output.swipeLeftAction = action
        case .right:
            output.swipeRightAction = action
        case .down:
            output.swipeDownAction = action
        case .up:
            output.swipeUpAction = action
        }
        return output
    }
    
    public var body: some View {
        self.content()
            .modifier(
                SwipeModifier(
                    drag: self.$drag,
                    distance: self.distance
                )
            )
            .onChange(of: drag) { output in
                switch output {
                case .left:
                    self.swipeLeftAction?()
                case .right:
                    self.swipeRightAction?()
                case .down:
                    self.swipeDownAction?()
                case .up:
                    self.swipeUpAction?()
                default:
                    break
                }
            }
    }
}

