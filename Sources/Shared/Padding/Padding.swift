/*
 
 Project: SwiftUIAdditions
 File: SwipeStack.swift
 Created by: Egor Boyko
 Date: 05.11.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

public struct Padding: View {
    public init(_ edges: Edge.Set, _ padding: CGFloat) {
        self.edges = edges
        self.padding = padding
        
    }
    private let padding: CGFloat
    private let edges: Edge.Set
    public var body: some View{
        HStack{}
            .padding(
                self.edges,
                self.padding
            )
    }
    
}
