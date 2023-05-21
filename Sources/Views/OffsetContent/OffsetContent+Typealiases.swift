/*

Project: SwiftUIAdditions
File: OffsetContent+Typealiases.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed

*/

import SwiftUI

extension OffsetContent {
    internal typealias MainContentWithAllParameters = (_ show: Binding<Bool>, _ offset: CGFloat) -> MainContent
    internal typealias MainContentWithShowParameter = (_ show: Binding<Bool>) -> MainContent
    internal typealias OffsetContentWithAllParameters = (_ show: Binding<Bool>, _ offset: CGFloat) -> OffsetContent
    internal typealias OffsetContentWithShowParameter = (_ show: Binding<Bool>) -> OffsetContent
    internal typealias OffsetContentWithOffsetParameter = ( _ offset: CGFloat) -> OffsetContent
    internal typealias OffsetContentWithoutParameters = () -> OffsetContent
}
