/*
 
 Project: SwiftUIAdditions
 File: RoundedShape+Style.swift
 Created by: Egor Boyko
 Date: 24.08.2023
 
 Status: #Complete | #Not decorated
 
 */

import Foundation

extension RoundedShape {
    public enum Style {
        case square
        case rectangle
        case dialog
        case button
        case custom(CGFloat)
        
        var divisor: CGFloat {
            switch self {
            case .rectangle:
                7.72
            case .button:
                21.8
            case .square:
                4.47
            case .dialog:
                41.3
            case .custom(let value):
                value
            }
        }
    }
}
