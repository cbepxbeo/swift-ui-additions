/*
 
 Project: SwiftUIAdditions
 File: OffsetContent.swift
 Created by: Егор Бойко
 Date: 21.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

public protocol OffsetContentStyle {}

public struct OffsetContentStyleDefault: OffsetContentStyle {}

public struct OffsetContent<MainContent: View, OffsetContent: View>: View {
    @ObservedObject var viewModel: OffsetContentViewModel
    internal let mainContentWithAllParameters: ((_ show: Binding<Bool>, _ offset: CGFloat) -> MainContent)?
    internal let mainContentWithShowParameter: ((_ show: Binding<Bool>) -> MainContent)?
    internal let offsetContentWithAllParameters: ((_ show: Binding<Bool>, _ offset: CGFloat) -> OffsetContent)?
    internal let offsetContentWithShowParameter: ((_ show: Binding<Bool>) -> OffsetContent)?
    internal let offsetContentWithOffsetParameter: ((_ offset: CGFloat) -> OffsetContent)?
    internal let offsetContentWithoutParameters: (() -> OffsetContent)?
    internal let mainContentOption: Self.MainContentOption
    internal let offsetContentOption: Self.OffsetContentOption
    internal let style: OffsetContentStyle

    public init(
        @ViewBuilder mainContent: @escaping (_ show: Binding<Bool>) -> MainContent,
        @ViewBuilder offsetContent: @escaping () -> OffsetContent) {
            self.mainContentOption = .withShow
            self.offsetContentOption = .without
            self._viewModel = .init(initialValue: .init())
            self.offsetContentWithoutParameters = offsetContent
            self.mainContentWithShowParameter = mainContent
            self.mainContentWithAllParameters = nil
            self.offsetContentWithAllParameters = nil
            self.offsetContentWithShowParameter = nil
            self.offsetContentWithOffsetParameter = nil
            self.style = OffsetContentStyleDefault()
    }
}


extension OffsetContent {
    
    var show: Binding<Bool> {
        .init(get: { self.viewModel.showOffsetContent }) { value in
            viewModel.showOffsetContent = value
            viewModel.render(.spring())
        }
    }
    
    public var body: some View {
        ZStack{
            GeometryReader{ mainGeometry in
                ZStack{
                    Color.clear
                    switch self.mainContentOption {
                    case .all:
                        if let mainContentWithAllParameters {
                            mainContentWithAllParameters(show, viewModel.offset)
                        }
                    case .withShow:
                        if let mainContentWithShowParameter {
                            mainContentWithShowParameter(show)
                        }
                    }
                }
                .mask(RoundedRectangle(cornerRadius: self.viewModel.showOffsetContent ? 13 : 0, style: .continuous))
                .rotation3DEffect(.degrees(viewModel.degrees), axis: (x: -50, y: 0, z: 0))
                .offset(y: -viewModel.offsetContent)
                .scaleEffect(viewModel.scaleEffect)
                .blur(radius: viewModel.blur)

                Color.black.opacity(viewModel.opacity)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            viewModel.showOffsetContent.toggle()
                            viewModel.render(.spring())
                        }
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
                
                Group{
                    switch self.offsetContentOption {
                    case .all:
                        if let offsetContentWithAllParameters {
                            offsetContentWithAllParameters(show, viewModel.offset)
                        }
                    case .withOffset:
                        if let offsetContentWithOffsetParameter {
                            offsetContentWithOffsetParameter(viewModel.offset)
                        }
                    case .withShow:
                        if let offsetContentWithShowParameter {
                            offsetContentWithShowParameter(show)
                        }
                        
                    case .without:
                        if let offsetContentWithoutParameters {
                            offsetContentWithoutParameters()
                        }
                    }
                }
                
                .offset(y: self.viewModel.offset)
                .offset(y: currentOffset)
                .background(
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
                )
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
        .background(
            Group{
                self.viewModel.showOffsetContent ? Color.black : Color.purple
            }
            .animation(.easeOut(duration: 0.8), value: self.viewModel.showOffsetContent)
        )
    }
}


extension OffsetContent {
    internal enum MainContentOption {
        case all, withShow
    }
}

extension OffsetContent {
    internal enum OffsetContentOption {
        case all, withShow, withOffset, without
    }
}

