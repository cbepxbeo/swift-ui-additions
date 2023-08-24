/*
 
 Project: SwiftUIAdditions
 File: RoundedShape+Modifiers
 Created by: Егор Бойко
 Date: 24.08.2023
 
 Status: #Complete | #Not decorated
 
 */


import SwiftUI

extension RoundedShape {
    public func fill(_ color: Color) -> Self {
        var view = self
        view.color = color
        return view
    }
    
    public func style(_ style: Self.Style) -> Self {
        var view = self
        view.color = color
        return view
    }
}
