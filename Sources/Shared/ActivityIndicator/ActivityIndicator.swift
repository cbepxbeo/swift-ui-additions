/*
 
 Project: SwiftUIAdditions
 File: ActivityIndicator.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

public struct ActivityIndicator: View {
    init(option: ActivityIndicator.Option) {
        self.option = option
    }
    let option: ActivityIndicator.Option
    public var body: some View {
        ZStack{
            switch self.option {
            case .arcs(_, _):
                EmptyView()
            case .default(let count):
                Self.Default(count)
            case .equalizer(_):
                EmptyView()
            case .flickeringDots(_):
                EmptyView()
            case .growingArc(_, _):
                EmptyView()
            case .growingCircle:
                EmptyView()
            case .gradient(_, _, _):
                EmptyView()
            case .opacityDots(_, _):
                EmptyView()
            case .rotatingDots(let count):
                Self.Rotating(count)
            case .scalingDots(_, _):
                EmptyView()
            }
        }
    }
    
}
