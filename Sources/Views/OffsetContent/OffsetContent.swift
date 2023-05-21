/*

Project: SwiftUIAdditions
File: OffsetContent.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed | #Not decorated

*/

import SwiftUI
import SwiftUtilities

public struct OffsetContent<MainContent: View, OffsetContent: View>: View {
    internal init(
        mainContentWithAllParameters: UniversalWrap<MainContentWithAllParameters>? = nil,
        mainContentWithShowParameter: UniversalWrap<MainContentWithShowParameter>? = nil,
        offsetContentWithAllParameters: UniversalWrap<OffsetContentWithAllParameters>? = nil,
        offsetContentWithShowParameter: UniversalWrap<OffsetContentWithShowParameter>? = nil,
        offsetContentWithOffsetParameter: UniversalWrap<OffsetContentWithOffsetParameter>? = nil,
        offsetContentWithoutParameters: UniversalWrap<OffsetContentWithoutParameters>? = nil,
        mainContentOption:  Self.MainContentOption,
        offsetContentOption: Self.OffsetContentOption
    ){
        self._viewModel = .init(initialValue: .init())
        self.mainContentOption = mainContentOption
        self.offsetContentOption = offsetContentOption
        self.mainContentWithAllParameters = mainContentWithAllParameters?.value ?? nil
        self.mainContentWithShowParameter = mainContentWithShowParameter?.value ?? nil
        self.offsetContentWithoutParameters = offsetContentWithoutParameters?.value ?? nil
        self.offsetContentWithAllParameters = offsetContentWithAllParameters?.value ?? nil
        self.offsetContentWithShowParameter = offsetContentWithShowParameter?.value ?? nil
        self.offsetContentWithOffsetParameter = offsetContentWithOffsetParameter?.value ?? nil
    }
    
    @ObservedObject var viewModel: OffsetContentViewModel
    internal let mainContentWithAllParameters: MainContentWithAllParameters?
    internal let mainContentWithShowParameter: MainContentWithShowParameter?
    internal let offsetContentWithAllParameters: OffsetContentWithAllParameters?
    internal let offsetContentWithShowParameter: OffsetContentWithShowParameter?
    internal let offsetContentWithOffsetParameter: OffsetContentWithOffsetParameter?
    internal let offsetContentWithoutParameters: OffsetContentWithoutParameters?
    internal let mainContentOption: Self.MainContentOption
    internal let offsetContentOption: Self.OffsetContentOption
}
