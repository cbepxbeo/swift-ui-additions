/*

Project: SwiftUIAdditions
File: OffsetContent+Property+OutputShow.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed

*/

import SwiftUI

extension OffsetContent {
    internal var outputShow: Binding<Bool> {
        .init(get: { self.viewModel.showOffsetContent }) {
            self.viewModel.showOffsetContent = $0
            self.viewModel.render(self.viewModel.showAnimation)
        }
    }
}
