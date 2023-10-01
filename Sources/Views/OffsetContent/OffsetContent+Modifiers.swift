/*
 
 Project: SwiftUIAdditions
 File: OffsetContent+Modifiers.swift
 Created by: Egor Boyko
 Date: 21.05.2023
 
 Status: #Completed | #Not decorated
 
 */

import SwiftUI

extension OffsetContent {
    public func blurEffect(radius: CGFloat?) -> Self {
        self.viewModel.style.blurEffect = radius
        return self
    }
    
    public func automaticOffset(_ value: Bool, offset: CGFloat? = nil) -> Self {
        self.viewModel.style.automaticOffset = (offset ?? 50, value)
        return self
    }
    
    public func offsetMainContent(_ y: CGFloat?) -> Self {
        self.viewModel.style.offsetContent = y
        return self
    }
    
    public func mainContentScaleEffect(_ value: CGFloat?) -> Self {
        self.viewModel.style.scaleEffect = value
        return self
    }
    
    public func overlayColor(_ color: Color?) -> Self {
        self.viewModel.style.overlayColor = color
        return self
    }
    
    public func opacityOverlayColor(_ opacity: CGFloat?) -> Self {
        self.viewModel.style.opacityOverlayColor = opacity
        return self
    }
    
    public func beforeShowBackgroundColor(_ color: Color?) -> Self {
        self.viewModel.style.beforeShowBackgroundColor = color
        return self
    }
    
    public func afterShowBackgroundColor(_ color: Color?) -> Self {
        self.viewModel.style.afterShowBackgroundColor = color
        return self
    }
    
    public func animationBackgroundColor(_ animation: Animation? = .default) -> Self {
        self.viewModel.style.animationBackgroundColor = animation
        return self
    }
    
    public func hideAnimation(_ animation: Animation? = .default) -> Self {
        self.viewModel.style.hideAnimation = animation
        return self
    }
    
    public func showAnimation(_ animation: Animation? = .default) -> Self {
        self.viewModel.style.showAnimation = animation
        return self
    }
    
    public func style(_ style: OffsetContentStyle) -> Self {
        self.viewModel.style = style
        return self
    }
}
