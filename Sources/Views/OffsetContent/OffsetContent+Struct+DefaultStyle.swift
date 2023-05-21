/*

Project: SwiftUIAdditions
File: OffsetContent+Struct+DefaultStyle.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed

*/

import SwiftUI

extension OffsetContent {
    internal struct DefaultStyle: OffsetContentStyle {
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
        internal var blurEffect: CGFloat?
        internal var offsetContent: CGFloat?
        internal var automaticOffset: (offset: CGFloat, value: Bool)
        internal var scaleEffect: CGFloat?
        internal var beforeShowBackgroundColor: Color?
        internal var afterShowBackgroundColor: Color?
        internal var overlayColor: Color?
        internal var opacityOverlayColor: CGFloat?
        internal var animationBackgroundColor: Animation?
        internal var hideAnimation: Animation?
        internal var showAnimation: Animation?
    }
}


