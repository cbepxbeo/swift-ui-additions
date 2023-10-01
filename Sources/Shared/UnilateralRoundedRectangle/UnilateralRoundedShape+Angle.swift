/*
 
 Project: SwiftUIAdditions
 File: UnilateralRoundedShape+Angle.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import SwiftUI
import SwiftUIExtension

extension UnilateralRoundedShape {
    public enum Angle: Int, Identifiable {
        public var id: Int {
            self.rawValue
        }
        
        case topLeading
        case topTrailing
        case bottomLeading
        case bottomTrailing
        
        var alignment: PushedInsideStackAlignment {
            switch self {
            case .topLeading:
                return .topLeading
            case .topTrailing:
                return .topTrailing
            case .bottomLeading:
                return .bottomLeading
            case .bottomTrailing:
                return .bottomTrailing
            }
        }
    }
}
