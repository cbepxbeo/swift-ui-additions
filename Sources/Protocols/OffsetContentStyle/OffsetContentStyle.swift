/*
 
 Project: SwiftUIAdditions
 File: OffsetContent.swift
 Created by: Egor Boyko
 Date: 21.05.2023
 
 Status: #Completed | #Not decorated
 
 */

import SwiftUI

public protocol OffsetContentStyle {
    var blurEffect: CGFloat? { get set }
    var offsetContent: CGFloat? { get set }
    var automaticOffset: (offset: CGFloat, value: Bool) { get set }
    var scaleEffect: CGFloat? { get set }
    var beforeShowBackgroundColor: Color? { get set }
    var afterShowBackgroundColor: Color? { get set }
    var overlayColor: Color? { get set }
    var opacityOverlayColor: CGFloat? { get set }
    var animationBackgroundColor: Animation? { get set }
    var hideAnimation: Animation? { get set }
    var showAnimation: Animation? { get set }
}
