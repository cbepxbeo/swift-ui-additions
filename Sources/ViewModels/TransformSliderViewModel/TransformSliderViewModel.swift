/*

Project: SwiftUIAdditions
File: TransformSliderViewModel.swift
Created by: Егор Бойко
Date: 20.05.2023

Status: #In progress | #Not decorated

*/

import SwiftUI

internal final class TransformSliderViewModel: ObservableObject {
    internal var _geometryWidth: CGFloat? = nil
    internal let minimumDistance: CGFloat = 50
    internal let swipeDistance: CGFloat = 150
    internal var current: CGFloat = 0
    internal var offset: CGFloat = 0 {
        willSet {
            self.objectWillChange.send()
        }
    }
}
