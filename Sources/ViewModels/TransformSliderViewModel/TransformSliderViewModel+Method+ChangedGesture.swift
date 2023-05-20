/*

Project: SwiftUIAdditions
File: TransformSliderViewModel+Method+ChangedGesture.swift
Created by: Егор Бойко
Date: 20.05.2023

Status: #In progress | #Not decorated

*/

import SwiftUI

extension TransformSliderViewModel {
    internal func changedGesture(value: DragGesture.Value, count: Int){
        let currentOffset = value.translation.width
        let count: CGFloat = .init(count - 1)
        
        if self.current == 0 && currentOffset > 0 {
            if value.translation.width > self.minimumDistance {
                
                let x: CGFloat
                
                if currentOffset > self.endPoint {
                    x = 6 + ((currentOffset - self.endPoint) / 10)
                } else {
                    let factor = (self.minimumDistance - currentOffset) / 100
                    x = (currentOffset - self.minimumDistance) * factor
                }
                self.offset = x + self.minimumDistance + self.total
            } else {
                self.offset = currentOffset + self.total
            }
        } else if current == -count  && currentOffset < 0 {
            if value.translation.width < -self.minimumDistance {
                
                let x: CGFloat
                
                if currentOffset < -self.endPoint {
                    x = -6 - ((currentOffset + self.endPoint) / 10)
                } else {
                    let factor = (self.minimumDistance + currentOffset) / 100
                    x = (currentOffset + minimumDistance) * factor
                }
                self.offset = self.total - x - self.minimumDistance

            } else {
                self.offset = currentOffset + self.total
            }
        } else {
            self.offset = currentOffset + self.total
        }
    }
}
