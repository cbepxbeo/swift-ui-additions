/*
 
 Project: SwiftUIAdditions
 File: TransformSliderViewModel.swift
 Created by: Egor Boyko
 Date: 20.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

final class TransformSliderViewModel: ObservableObject {
    var _geometryWidth: CGFloat? = nil
    let minimumDistance: CGFloat = 50
    let swipeDistance: CGFloat = 150
    var current: CGFloat = 0
    var offset: CGFloat = 0 {
        willSet {
            self.objectWillChange.send()
        }
    }
}
