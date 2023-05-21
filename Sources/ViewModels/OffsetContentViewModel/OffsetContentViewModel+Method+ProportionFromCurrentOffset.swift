/*

Project: SwiftUIAdditions
File: OffsetContentViewModel+Method+ProportionFromCurrentOffset.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed | #Not decorated

*/

import SwiftUI
 
extension OffsetContentViewModel {
    func proportionFromCurrentOffset(max: CGFloat) -> CGFloat{
        
        func percentFromOffset() -> CGFloat {
            if height != .zero {
                return (self.height - self.offset) / (self.height / 100)
            }
            return 0
        }
        
        if !self.showOffsetContent {
            return 0
        }
        return (max / 100) * percentFromOffset()
    }
}
