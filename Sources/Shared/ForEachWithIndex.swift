/*

Project: SwiftUIAdditions
File: ForEachWithIndex.swift
Created by: Егор Бойко
Date: 19.05.2023

Status: #Complete | #Not decorated

*/

import SwiftUI

public struct ForEachWithIndex<Collection: RandomAccessCollection, Content: View>: View where Collection.Element: Identifiable {
    public init(
        _ collection: Collection,
        @ViewBuilder content: @escaping (Collection.Index, Collection.Element) -> Content
    ) {
        self.collection = collection
        self.content = content
    }
    
    private let collection: Collection
    private let content: (Collection.Index, Collection.Element) -> Content
    
    public var body: some View {
        ForEach(Array(zip(self.collection.indices, self.collection)), id: \.1.id) {
            self.content($0, $1)
        }
    }
}





import Foundation
