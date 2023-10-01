/*
 
 Project: SwiftUIAdditions
 File: Handle.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Completed | #Not required
 
 */

import SwiftUI

public struct Handle: View{
    public init(){
        self.color = .gray
    }
    var color: Color
    public func fill(color: Color) -> Self {
        var temp = self
        temp.color = color
        return temp
    }
    public var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(self.color)
            .frame(width: 36.5, height: 5)
    }
}
