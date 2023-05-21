/*

Project: SwiftUIAdditions
File: OffsetContent+Initializers.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed | #Not decorated

*/

import SwiftUI

extension OffsetContent {
    public init(
        @ViewBuilder mainContent: @escaping (_ show: Binding<Bool>) -> MainContent,
        @ViewBuilder offsetContent: @escaping () -> OffsetContent) {
            self.init(
                mainContentWithShowParameter: .init(mainContent),
                offsetContentWithoutParameters: .init(offsetContent),
                mainContentOption: .withShow,
                offsetContentOption: .without
            )
        }
}
