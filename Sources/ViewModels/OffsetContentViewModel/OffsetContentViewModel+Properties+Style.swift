/*

Project: SwiftUIAdditions
File: OffsetContentViewModel+Properties+Style.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed | #Not decorated

*/

import SwiftUI
 
extension OffsetContentViewModel {
    internal var beforeShowBackgroundColor: Color {
        self.style.beforeShowBackgroundColor ?? .black
    }
    internal var afterShowBackgroundColor: Color {
        self.style.afterShowBackgroundColor ?? .black
    }
    internal var overlayColor: Color {
        self.style.overlayColor ?? .black
    }
    internal var animationBackgroundColor: Animation? {
        self.style.animationBackgroundColor
    }
    internal var hideAnimation: Animation? {
        self.style.hideAnimation
    }
    internal var showAnimation: Animation? {
        self.style.showAnimation
    }
}

