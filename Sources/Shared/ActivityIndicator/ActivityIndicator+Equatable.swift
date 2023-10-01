/*
 
 Project: SwiftUIAdditions
 File: ActivityIndicator+Equatable.swift
 Created by: Egor Boyko
 Date: 01.10.2023
 
 Status: #Complete | #Not decorated
 
 */

extension ActivityIndicator : Equatable {
    public static func == (lhs: ActivityIndicator, rhs: ActivityIndicator) -> Bool {
        lhs.option == rhs.option
    }
}
