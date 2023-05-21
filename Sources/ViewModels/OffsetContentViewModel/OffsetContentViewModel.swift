/*

Project: SwiftUIAdditions
File: OffsetContentViewModel.swift
Created by: Егор Бойко
Date: 21.05.2023

Status: #Completed | #Not decorated

*/

import Foundation
import SwiftUI

internal final class OffsetContentViewModel: ObservableObject {
    internal var height: CGFloat = .zero
    internal var isReady: Bool = false
    internal var showOffsetContent: Bool = false
    internal var offset: CGFloat = 0
    internal var style: OffsetContentStyle = OffsetContentDefaultStyle()
}
