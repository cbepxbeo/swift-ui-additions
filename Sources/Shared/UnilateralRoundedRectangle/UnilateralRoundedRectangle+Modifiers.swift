/*
 
 Project: SwiftUIAdditions
 File: UnilateralRoundedRectangle+Modifiers.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import SwiftUI

extension UnilateralRoundedShape {
    public func disabledAngle(_ angle: UnilateralRoundedShape.Angle...) -> Self{
        var temp = self
        angle.forEach{
            temp.disabledAngle.insert($0)
        }
        return temp
    }
    
    public func fill(_ color: Color) -> Self{
        var temp = self
        temp.color = color
        return temp
    }
}
