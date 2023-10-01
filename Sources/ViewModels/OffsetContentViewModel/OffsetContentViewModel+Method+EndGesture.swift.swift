/*
 
 Project: SwiftUIAdditions
 File: OffsetContentViewModel+Method+EndGesture.swift
 Created by: Egor Boyko
 Date: 21.05.2023
 
 Status: #Completed | #Not decorated
 
 */

import SwiftUI

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
