/*
 
 Project: SwiftUIAdditions
 File: TransformSliderViewModel+Method+EndGesture.swift
 Created by: Egor Boyko
 Date: 20.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

extension TransformSliderViewModel {
    func endGesture(value: DragGesture.Value, count: Int){
        let currentOffset = value.translation.width
        let count: CGFloat = .init(count - 1)
        
        if currentOffset < -self.swipeDistance && self.current != -count {
            current -= 1
            
        } else if currentOffset > self.swipeDistance && self.current != 0 {
            self.current += 1
        }
        withAnimation(.spring()) {
            self.offset = self.total
        }
    }
}
