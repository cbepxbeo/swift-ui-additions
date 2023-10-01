/*
 
 Project: SwiftUIAdditions
 File: OffsetContent+Method+MakeOffsetContent.swift
 Created by: Egor Boyko
 Date: 21.05.2023
 
 Status: #Completed
 
 */

import SwiftUI

extension OffsetContent {
    func makeOffsetContent(offset: CGFloat) -> some View {
        Group{
            switch self.offsetContentOption {
            case .all:
                if let offsetContentWithAllParameters {
                    offsetContentWithAllParameters(self.outputShow, viewModel.offset)
                }
            case .withOffset:
                if let offsetContentWithOffsetParameter {
                    offsetContentWithOffsetParameter(viewModel.offset)
                }
            case .withShow:
                if let offsetContentWithShowParameter {
                    offsetContentWithShowParameter(self.outputShow)
                }
                
            case .without:
                if let offsetContentWithoutParameters {
                    offsetContentWithoutParameters()
                }
            }
        }
        .offset(y: self.viewModel.offset)
        .offset(y: offset)
        .background(self.makeGeometryGetter())
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged{
                self.viewModel.changedGesture(value: $0)
            }
            .onEnded{
                self.viewModel.endGesture(value: $0)
            }
        )
    }
}
