/*
 
 Project: SwiftUIAdditions
 File: OffsetContent.swift
 Created by: Егор Бойко
 Date: 21.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI

public struct OffsetContent<MainContent: View, OffsetContent: View>: View {
    internal let mainContentWithAllParameters: ((_ show: Binding<Bool>, _ offset: CGFloat) -> MainContent)?
    internal let mainContentWithShowParameter: ((_ show: Binding<Bool>) -> MainContent)?
    internal let offsetContentWithAllParameters: ((_ show: Binding<Bool>, _ offset: CGFloat) -> OffsetContent)?
    internal let offsetContentWithShowParameter: ((_ show: Binding<Bool>) -> OffsetContent)?
    internal let offsetContentWithOffsetParameter: ((_ offset: CGFloat) -> OffsetContent)?
    internal let offsetContentWithoutParameters: (() -> OffsetContent)?
}


extension OffsetContent {
    public var body: some View {
        Color.red
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

