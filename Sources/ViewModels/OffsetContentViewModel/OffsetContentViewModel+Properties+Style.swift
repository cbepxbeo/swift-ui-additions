/*
 
 Project: SwiftUIAdditions
 File: OffsetContentViewModel+Properties+Style.swift
 Created by: Egor Boyko
 Date: 21.05.2023
 
 Status: #Completed | #Not decorated
 
 */

import SwiftUI

extension OffsetContentViewModel {
    var beforeShowBackgroundColor: Color {
        self.style.beforeShowBackgroundColor ?? .black
    }
    var afterShowBackgroundColor: Color {
        self.style.afterShowBackgroundColor ?? .black
    }
    var overlayColor: Color {
        self.style.overlayColor ?? .black
    }
    var animationBackgroundColor: Animation? {
        self.style.animationBackgroundColor
    }
    var hideAnimation: Animation? {
        self.style.hideAnimation
    }
    var showAnimation: Animation? {
        self.style.showAnimation
    }
}

