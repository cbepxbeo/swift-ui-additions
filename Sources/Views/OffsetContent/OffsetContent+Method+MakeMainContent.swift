/*

Project: SwiftUIAdditions
File: OffsetContent+Method+MakeMainContent.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed

*/

import SwiftUI

extension OffsetContent {
    internal func makeMainContent() -> some View {
        ZStack{
            Color.clear
            switch self.mainContentOption {
            case .all:
                if let mainContentWithAllParameters {
                    mainContentWithAllParameters(self.outputShow, viewModel.offset)
                }
            case .withShow:
                if let mainContentWithShowParameter {
                    mainContentWithShowParameter(self.outputShow)
                }
            }
        }
        .mask(RoundedRectangle(cornerRadius: self.viewModel.showOffsetContent ? 13 : 0, style: .continuous))
        .rotation3DEffect(.degrees(self.viewModel.degrees), axis: (x: -50, y: 0, z: 0))
        .offset(y: -self.viewModel.offsetContent)
        .scaleEffect(self.viewModel.scaleEffect)
        .blur(radius: self.viewModel.blur)
    }
}
