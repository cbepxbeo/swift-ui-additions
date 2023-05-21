/*

Project: SwiftUIAdditions
File: OffsetContentDefaultStyle.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed | #Not decorated

*/

import SwiftUI

public struct OffsetContentDefaultStyle: OffsetContentStyle {
    public init(
        blurEffect: CGFloat? = nil,
        offsetContent: CGFloat? = nil,
        automaticOffset: (offset: CGFloat, value: Bool),
        scaleEffect: CGFloat? = nil,
        beforeShowBackgroundColor: Color? = nil,
        afterShowBackgroundColor: Color? = nil,
        overlayColor: Color? = nil,
        opacityOverlayColor: CGFloat? = nil,
        animationBackgroundColor: Animation? = nil,
        hideAnimation: Animation? = nil,
        showAnimation: Animation? = nil
    ) {
        self.blurEffect = blurEffect
        self.offsetContent = offsetContent
        self.automaticOffset = automaticOffset
        self.scaleEffect = scaleEffect
        self.beforeShowBackgroundColor = beforeShowBackgroundColor
        self.afterShowBackgroundColor = afterShowBackgroundColor
        self.overlayColor = overlayColor
        self.opacityOverlayColor = opacityOverlayColor
        self.animationBackgroundColor = animationBackgroundColor
        self.hideAnimation = hideAnimation
        self.showAnimation = showAnimation
    }
    
    internal init() {
        self.blurEffect = 3
        self.offsetContent = nil
        self.automaticOffset = (-50, true)
        self.scaleEffect = 0.8
        self.beforeShowBackgroundColor = .gray
        self.afterShowBackgroundColor = .black
        self.overlayColor = .black
        self.opacityOverlayColor = 0.4
        self.animationBackgroundColor = .easeIn(duration: 0.8)
        self.hideAnimation = .spring()
        self.showAnimation = .spring()
    }
    
    public var blurEffect: CGFloat?
    public var offsetContent: CGFloat?
    public var automaticOffset: (offset: CGFloat, value: Bool)
    public var scaleEffect: CGFloat?
    public var beforeShowBackgroundColor: Color?
    public var afterShowBackgroundColor: Color?
    public var overlayColor: Color?
    public var opacityOverlayColor: CGFloat?
    public var animationBackgroundColor: Animation?
    public var hideAnimation: Animation?
    public var showAnimation: Animation?
}
