/*
 
 Project: SwiftUIAdditions
 File: OffsetContentViewModel.swift
 Created by: Егор Бойко
 Date: 21.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation
import SwiftUI

internal final class OffsetContentViewModel: ObservableObject {
    internal var height: CGFloat = .zero
    internal var isReady: Bool = false
    internal var showOffsetContent: Bool = false
    internal var offset: CGFloat = 0
    internal var style: OffsetContentStyle
    init(style: OffsetContentStyle){
        self.style = style
    }
}
 

extension OffsetContentViewModel {
    
    func changedGesture(value: DragGesture.Value){
        let currentOffset = value.translation.height
        if currentOffset < 0 {
            return
        }
        if currentOffset > height - (height / 4)   {
            self.offset = 0
            self.showOffsetContent = false
            self.render(self.style.hideAnimation)
            return
        }
        self.offset = currentOffset
        self.render()
    }
}

extension OffsetContentViewModel {
    
    func endGesture(value: DragGesture.Value){
        let currentOffset = value.translation.height
        if currentOffset < (self.height / 3 > 100 ? 100 : self.height / 3) {
            self.offset = 0
            self.showOffsetContent = true
            self.render(.spring())
        } else {
            self.offset = 0
            self.showOffsetContent = false
            self.render(self.style.hideAnimation)
        }
    }
}

extension OffsetContentViewModel {
    
    func getFromCurrentOffset(max: CGFloat) -> CGFloat{
        if !self.showOffsetContent {
            return 0
        }
        return (max / 100) * self.percentFromOffset
    }
}

extension OffsetContentViewModel {
    var percent: CGFloat  {
        height / 100
    }
    
    var percentFromOffset: CGFloat {
        if height != .zero {
            return (height - self.offset) / percent
        }
        return 0
    }
    
    var blur: CGFloat {
        guard let blur = self.style.blurEffect else {
            return 0
        }
        return self.getFromCurrentOffset(max: blur)
    }
    
    var opacity: CGFloat {
        guard let opacity = self.style.opacityOverlayColor else {
            return 0.001
        }
        return self.getFromCurrentOffset(
            max: opacity > 1 ? 1 : (opacity < 0 || opacity == 0) ? 0.001 : opacity
        )
    }
    
    var degrees: CGFloat {
        self.getFromCurrentOffset(max: 15)
    }
    
    var offsetContent: CGFloat {
        if self.style.automaticOffset.value {
            return self.getFromCurrentOffset(max: height + self.style.automaticOffset.offset)
        }
        
        guard let offset = self.style.offsetContent else {
            return 0
        }
        return self.getFromCurrentOffset(max: offset)
    }
    
    var scaleEffect: CGFloat {
        guard let scaleEffect = self.style.scaleEffect, scaleEffect > 0 else {
            return 1
        }
        
        if scaleEffect > 1 {
            return 1 + self.getFromCurrentOffset(max: scaleEffect - 1)
            
        } else {
            return 1 - self.getFromCurrentOffset(max: 1 - scaleEffect)
        }
    }
    
    
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
