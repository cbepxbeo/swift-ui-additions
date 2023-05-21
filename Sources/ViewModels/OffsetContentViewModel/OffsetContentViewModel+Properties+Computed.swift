/*

Project: SwiftUIAdditions
File: OffsetContentViewModel+Properties+Computed.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed | #Not decorated

*/

import SwiftUI
 
extension OffsetContentViewModel {
    internal var blur: CGFloat {
        guard let blur = self.style.blurEffect else {
            return 0
        }
        return self.proportionFromCurrentOffset(max: blur)
    }
    
    internal var opacity: CGFloat {
        guard let opacity = self.style.opacityOverlayColor else {
            return 0.001
        }
        return self.proportionFromCurrentOffset(
            max: opacity > 1 ? 1 : (opacity < 0 || opacity == 0) ? 0.001 : opacity
        )
    }
    
    internal var degrees: CGFloat {
        self.proportionFromCurrentOffset(max: 15)
    }
    
    internal var offsetContent: CGFloat {
        if self.style.automaticOffset.value {
            return self.proportionFromCurrentOffset(max: height + self.style.automaticOffset.offset)
        }
        
        guard let offset = self.style.offsetContent else {
            return 0
        }
        return self.proportionFromCurrentOffset(max: offset)
    }
    
    internal var scaleEffect: CGFloat {
        guard let scaleEffect = self.style.scaleEffect, scaleEffect > 0 else {
            return 1
        }
        
        if scaleEffect > 1 {
            return 1 + self.proportionFromCurrentOffset(max: scaleEffect - 1)
            
        } else {
            return 1 - self.proportionFromCurrentOffset(max: 1 - scaleEffect)
        }
    }
}

