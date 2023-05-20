/*
 
 Project: SwiftUIAdditions
 File: TransformSlider+Body.swift
 Created by: Егор Бойко
 Date: 20.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI
import SwiftUIExtension

extension TransformSlider {
    public var body: some View {
        GeometryReader{ proxy in
            let width: CGFloat = proxy.size.width - 50
            let count = self.array.count
            let _ = { self.viewModel.geometryWidth = proxy.size.width - 50 }()
            
            ZStack{
                Color.click
                ForEach(0...(self.array.count - 1), id: \.self){ index in
                    
                    let totalOffset: CGFloat = width * .init(index)
                    let degrees = self.viewModel.degrees(index: index)
                    
                    ZStack{
                        Color.red.opacity(0.1)
                        self.content(index, degrees)
                    }
                    .frame(width: width - 20)
                    .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 10, z: 0))
                    .animation(.spring(), value: degrees)
                    .offset(x: self.viewModel.offset)
                    .offset(x: totalOffset)
                }
            }
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged{
                    self.viewModel.changedGesture(value: $0, count: count)
                }
                .onEnded{
                    self.viewModel.endGesture(value: $0, count: count)
                }
            )
        }
    }
}
