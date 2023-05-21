/*
 
 Project: SwiftUIAdditions
 File: OffsetContent.swift
 Created by: Егор Бойко
 Date: 21.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

public protocol OffsetContentStyle {
    var blurEffect: CGFloat? { get set }
    var offsetContent: CGFloat? { get set }
    var automaticOffset: (offset: CGFloat, value: Bool) { get set }
    var scaleEffect: CGFloat? { get set }
    var beforeShowBackgroundColor: Color? { get set }
    var afterShowBackgroundColor: Color? { get set }
    var overlayColor: Color? { get set }
    var opacityOverlayColor: CGFloat? { get set }
    var animationBackgroundColor: Animation? { get set }
    var hideAnimation: Animation? { get set }
    var showAnimation: Animation? { get set }
}

public struct OffsetContentStyleDefault: OffsetContentStyle {
    public var blurEffect: CGFloat?
    public var offsetContent: CGFloat?
    public var automaticOffset: (offset: CGFloat, value: Bool) = (-50, true)
    public var scaleEffect: CGFloat? = 0.8
    public var beforeShowBackgroundColor: Color?
    public var afterShowBackgroundColor: Color?
    public var overlayColor: Color?
    public var opacityOverlayColor: CGFloat? = 0.4
    public var animationBackgroundColor: Animation? = .easeOut(duration: 0.8)
    public var hideAnimation: Animation? = .spring()
    public var showAnimation: Animation? = .spring()
}

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
            self._viewModel = .init(initialValue: .init(style: OffsetContentStyleDefault()))
            self.offsetContentWithoutParameters = offsetContent
            self.mainContentWithShowParameter = mainContent
            self.mainContentWithAllParameters = nil
            self.offsetContentWithAllParameters = nil
            self.offsetContentWithShowParameter = nil
            self.offsetContentWithOffsetParameter = nil
            self.style = OffsetContentStyleDefault()
    }
    
    public func blurEffect(radius: CGFloat?) -> Self {
        self.viewModel.style.blurEffect = radius
        return self
    }
    
    public func automaticOffset(_ value: Bool, offset: CGFloat? = nil) -> Self {
        self.viewModel.style.automaticOffset = (offset ?? 50, value)
        return self
    }
    
    public func offsetMainContent(_ y: CGFloat?) -> Self {
        self.viewModel.style.offsetContent = y
        return self
    }
    public func mainContentScaleEffect(_ value: CGFloat?) -> Self {
        self.viewModel.style.scaleEffect = value
        return self
    }
    
    public func overlayColor(_ color: Color?) -> Self {
        self.viewModel.style.overlayColor = color
        return self
    }
    
    public func opacityOverlayColor(_ opacity: CGFloat?) -> Self {
        self.viewModel.style.opacityOverlayColor = opacity
        return self
    }
    
    
    public func beforeShowBackgroundColor(_ color: Color?) -> Self {
        self.viewModel.style.beforeShowBackgroundColor = color
        return self
    }
    
    public func afterShowBackgroundColor(_ color: Color?) -> Self {
        self.viewModel.style.afterShowBackgroundColor = color
        return self
    }
    
    public func animationBackgroundColor(_ animation: Animation? = .default) -> Self {
        self.viewModel.style.animationBackgroundColor = animation
        return self
    }
    public func hideAnimation(_ animation: Animation? = .default) -> Self {
        self.viewModel.style.hideAnimation = animation
        return self
    }
    public func showAnimation(_ animation: Animation? = .default) -> Self {
        self.viewModel.style.showAnimation = animation
        return self
    }
}


extension OffsetContent {
    
    var show: Binding<Bool> {
        .init(get: { self.viewModel.showOffsetContent }) { value in
            viewModel.showOffsetContent = value
            viewModel.render(viewModel.showAnimation)
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

                self.viewModel.overlayColor.opacity(self.viewModel.opacity)
                    .onTapGesture {
                        //withAnimation(.spring()) {
                            self.viewModel.showOffsetContent.toggle()
                        self.viewModel.render(self.viewModel.hideAnimation)
                        //}
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
                self.viewModel.showOffsetContent ?
                self.viewModel.afterShowBackgroundColor :
                self.viewModel.beforeShowBackgroundColor
               
            }
            .animation(self.viewModel.animationBackgroundColor, value: self.viewModel.showOffsetContent)
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

