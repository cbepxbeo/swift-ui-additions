/*
 
 Project: SwiftUIAdditions
 File: ImageWrapper.swift
 Created by: Egor Boyko
 Date: 24.08.2023
 
 Status: #Complete | #Not decorated
 
 */

import SwiftUI
import SwiftUtilities

///Allows a type to wrap an Image and duplicates Image methods
public protocol ImageWrapper: View where Body == Image {
    associatedtype Asset: AssetConvertable
    var value: Asset { get }
}

