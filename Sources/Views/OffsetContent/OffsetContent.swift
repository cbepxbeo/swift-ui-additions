/*
 
 Project: SwiftUIAdditions
 File: OffsetContent.swift
 Created by: Egor Boyko
 Date: 21.05.2023
 
 Status: #Completed | #Not decorated
 
 */

import SwiftUI
import SwiftUtilities

public struct OffsetContent<MainContent: View, OffsetContent: View>: View {
    init(
        mainContentWithAllParameters: ValueWrapper<MainContentWithAllParameters>? = nil,
        mainContentWithShowParameter: ValueWrapper<MainContentWithShowParameter>? = nil,
        offsetContentWithAllParameters: ValueWrapper<OffsetContentWithAllParameters>? = nil,
        offsetContentWithShowParameter: ValueWrapper<OffsetContentWithShowParameter>? = nil,
        offsetContentWithOffsetParameter: ValueWrapper<OffsetContentWithOffsetParameter>? = nil,
        offsetContentWithoutParameters: ValueWrapper<OffsetContentWithoutParameters>? = nil,
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
    let mainContentWithAllParameters: MainContentWithAllParameters?
    let mainContentWithShowParameter: MainContentWithShowParameter?
    let offsetContentWithAllParameters: OffsetContentWithAllParameters?
    let offsetContentWithShowParameter: OffsetContentWithShowParameter?
    let offsetContentWithOffsetParameter: OffsetContentWithOffsetParameter?
    let offsetContentWithoutParameters: OffsetContentWithoutParameters?
    let mainContentOption: Self.MainContentOption
    let offsetContentOption: Self.OffsetContentOption
}
