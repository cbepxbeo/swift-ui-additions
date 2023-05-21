/*

Project: SwiftUIAdditions
File: OffsetContent+Body.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed

*/

import SwiftUI

extension OffsetContent {
    public var body: some View {
        ZStack{
            GeometryReader{ mainGeometry in
                self.makeMainContent()
                self.viewModel.overlayColor.opacity(self.viewModel.opacity)
                    .onTapGesture {
                        self.viewModel.showOffsetContent.toggle()
                        self.viewModel.render(self.viewModel.hideAnimation)
                    }
                let currentOffset: CGFloat = {
                    if self.viewModel.isReady {
                        return self.viewModel.showOffsetContent ?
                        mainGeometry.size.height - self.viewModel.height :
                        mainGeometry.size.height
                    } else {
                        return mainGeometry.size.height
                    }
                }()
                self.makeOffsetContent(offset: currentOffset)
            }
        }
        .background(
            self.makeBackground()
        )
    }
}
