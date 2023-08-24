/*
 
 Project: SwiftUIAdditions
 File: RoundedShape+Style.swift
 Created by: Егор Бойко
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
        
        var divisor: CGFloat {
            switch self {
            case .rectangle:
                return 7.72
            case .button:
                return 21.8
            case .square:
                return 4.47
            case .dialog:
                return 41.3
            }
        }
    }
}
