/*
 
 Project: SwiftUIAdditions
 File: ImageWrapper+Implementation.swift
 Created by: Egor Boyko
 Date: 24.08.2023
 
 Status: #Complete | #Not decorated
 
 */

import SwiftUI

extension ImageWrapper {
    public func resizable(
        capInsets: EdgeInsets = EdgeInsets(),
        resizingMode: Image.ResizingMode = .stretch
    ) -> Image {
        self.body.resizable(
            capInsets: capInsets,
            resizingMode: resizingMode
        )
    }
}

