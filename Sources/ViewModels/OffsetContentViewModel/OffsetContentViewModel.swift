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
            self.render(.spring())
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
            self.render(.spring())
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
        self.getFromCurrentOffset(max: 20)
    }
    
    var opacity: CGFloat {
        self.getFromCurrentOffset(max: 0.4)
    }
    
    var degrees: CGFloat {
        self.getFromCurrentOffset(max: 15)
    }
    
    var offsetContent: CGFloat {
        self.getFromCurrentOffset(max: height - 50)
    }
    
    var scaleEffect: CGFloat {
        1 - self.getFromCurrentOffset(max: 0.2)
    }
}
