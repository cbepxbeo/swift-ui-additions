/*
 
 Project: SwiftUIAdditions
 File: TransformSliderViewModel+Method+Degrees.swift
 Created by: Egor Boyko
 Date: 20.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

extension TransformSliderViewModel {
    func degrees(index: Int) -> CGFloat {
        let tempDegrees = self.difference / 17
        return index == -.init(self.current) ? tempDegrees : -tempDegrees
    }
}
