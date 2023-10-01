/*
 
 Project: SwiftUIAdditions
 File: OffsetContentViewModel.swift
 Created by: Egor Boyko
 Date: 21.05.2023
 
 Status: #Completed | #Not decorated
 
 */

import Foundation
import SwiftUI

final class OffsetContentViewModel: ObservableObject {
    var height: CGFloat = .zero
    var isReady: Bool = false
    var showOffsetContent: Bool = false
    var offset: CGFloat = 0
    var style: OffsetContentStyle = OffsetContentDefaultStyle()
}
