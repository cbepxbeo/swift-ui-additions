/*
 
 Project: SwiftUIAdditions
 File: LoggingView.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUtilities
import SwiftUI

public protocol LoggingView: View, Logging {
    associatedtype C: View
    var content: C { get }
    var viewName: String { get }
}

extension LoggingView {
    public var viewName: String { "\(Self.self)" }
    public var content: some View { EmptyView() }
    @ViewBuilder
    public var body: some View {
        let _ = { self.debugLog("Render body \(viewName)")}()
        self.content
    }
}
