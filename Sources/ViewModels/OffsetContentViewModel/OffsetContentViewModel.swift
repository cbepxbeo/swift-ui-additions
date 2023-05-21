/*
 
 Project: SwiftUIAdditions
 File: OffsetContentViewModel.swift
 Created by: Егор Бойко
 Date: 21.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation


internal final class OffsetContentViewModel: ObservableObject {
    internal var height: CGFloat = .zero
    internal var isReady: Bool = false
    internal var showOffsetContent: Bool = false
    internal var offset: CGFloat = 0
}
 
