/*
 
 Project: SwiftUIAdditions
 File: ViewModel.swift
 Created by: Egor Boyko
 Date: 24.08.2023
 
 Status: #Complete | #Not decorated
 
 */

import Combine

public protocol ViewModel: AnyObject, ObservableObject
where Self.ObjectWillChangePublisher == ObservableObjectPublisher {}
