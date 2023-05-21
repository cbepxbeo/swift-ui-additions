/*

Project: SwiftUIAdditions
File: OffsetContentViewModel+Method+ChangedGesture.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed | #Not decorated

*/

import SwiftUI
 
extension OffsetContentViewModel {
    internal func changedGesture(value: DragGesture.Value){
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
