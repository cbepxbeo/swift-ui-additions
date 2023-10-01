/*
 
 Project: SwiftUIAdditions
 File: OffsetContent+Property+OutputShow.swift
 Created by: Egor Boyko
 Date: 21.05.2023
 
 Status: #Completed
 
 */

import SwiftUI

extension OffsetContent {
    var outputShow: Binding<Bool> {
        .init(get: { self.viewModel.showOffsetContent }) {
            self.viewModel.showOffsetContent = $0
            self.viewModel.render(self.viewModel.showAnimation)
        }
    }
}
