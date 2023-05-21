/*

Project: SwiftUIAdditions
File: OffsetContent+Method+MakeBackground.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed

*/

import SwiftUI

extension OffsetContent {
    internal func makeBackground() -> some View {
        Group{
            self.viewModel.showOffsetContent ?
            self.viewModel.afterShowBackgroundColor :
            self.viewModel.beforeShowBackgroundColor
           
        }
        .animation(self.viewModel.animationBackgroundColor, value: self.viewModel.showOffsetContent)
    }
}
