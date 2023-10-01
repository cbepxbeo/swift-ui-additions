/*
 
 Project: SwiftUIAdditions
 File: OffsetContent+Typealiases.swift
 Created by: Egor Boyko
 Date: 21.05.2023
 
 Status: #Completed
 
 */

import SwiftUI

extension OffsetContent {
    typealias MainContentWithAllParameters = (_ show: Binding<Bool>, _ offset: CGFloat) -> MainContent
    typealias MainContentWithShowParameter = (_ show: Binding<Bool>) -> MainContent
    typealias OffsetContentWithAllParameters = (_ show: Binding<Bool>, _ offset: CGFloat) -> OffsetContent
    typealias OffsetContentWithShowParameter = (_ show: Binding<Bool>) -> OffsetContent
    typealias OffsetContentWithOffsetParameter = ( _ offset: CGFloat) -> OffsetContent
    typealias OffsetContentWithoutParameters = () -> OffsetContent
}
