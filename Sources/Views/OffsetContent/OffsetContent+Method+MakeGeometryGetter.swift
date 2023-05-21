/*

Project: SwiftUIAdditions
File: OffsetContent+Method+MakeGeometryGetter.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed

*/

import SwiftUI

extension OffsetContent {
    internal func makeGeometryGetter() -> some View {
        Group{
            if !viewModel.isReady {
                GeometryReader{ backgroudGeometry in
                    let _ = {
                        self.viewModel.height = backgroudGeometry.size.height
                        self.viewModel.isReady = true
                        DispatchQueue.main.async {
                            self.viewModel.render()
                        }
                    }()
                    Color.clear
                }
            } else {
                GeometryReader{ backgroudGeometry in
                    let _ = {
                        self.viewModel.height = backgroudGeometry.size.height
                    }()
                    Color.clear
                }
            }
        }
    }
}
