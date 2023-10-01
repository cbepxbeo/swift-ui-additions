/*
 
 Project: SwiftUIAdditions
 File: ActivityIndicator+Option.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

import SwiftUI

extension ActivityIndicator {
    enum Option: Equatable {
        case arcs(count: Int, lineWidth: CGFloat)
        case `default`(count: Int)
        case equalizer(count: Int)
        case flickeringDots(count: Int)
        case growingArc(Color, lineWidth: CGFloat)
        case growingCircle
        case gradient(_ colors: [Color], CGLineCap, lineWidth: CGFloat)
        case opacityDots(count: Int, inset: Int)
        case rotatingDots(count: Int)
        case scalingDots(count: Int, inset: Int)
    }
}
