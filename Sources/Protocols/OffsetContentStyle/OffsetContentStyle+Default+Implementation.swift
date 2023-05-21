/*
 
 Project: SwiftUIAdditions
 File: OffsetContentStyle+Default+Implementation.swift
 Created by: Егор Бойко
 Date: 21.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import SwiftUI
import SwiftUtilities

fileprivate var storage: [String: OffsetContentStyleDefault] = [:]

extension OffsetContentStyle {
    
    private var key: String {
        if let owner = self.ownerModel {
            return "\(MemoryAddress(of: owner))"
        }
        return "\(Self.self)"
    }
    
    public var blurEffect: CGFloat? {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.blurEffect
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.blurEffect
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.blurEffect = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.blurEffect = newValue
            }
        }
    }
    
    public var offsetContent: CGFloat? {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.offsetContent
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.offsetContent
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.offsetContent = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.offsetContent = newValue
            }
        }
    }
    public var automaticOffset: (offset: CGFloat, value: Bool) {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.automaticOffset
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.automaticOffset
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.automaticOffset = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.automaticOffset = newValue
            }
        }
    }
    public var scaleEffect: CGFloat? {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.scaleEffect
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.scaleEffect
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.scaleEffect = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.scaleEffect = newValue
            }
        }
    }
    public var beforeShowBackgroundColor: Color? {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.beforeShowBackgroundColor
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.beforeShowBackgroundColor
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.beforeShowBackgroundColor = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.beforeShowBackgroundColor = newValue
            }
        }
    }
    public var afterShowBackgroundColor: Color? {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.afterShowBackgroundColor
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.afterShowBackgroundColor
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.afterShowBackgroundColor = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.afterShowBackgroundColor = newValue
            }
        }
    }
    public var overlayColor: Color? {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.overlayColor
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.overlayColor
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.overlayColor = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.overlayColor = newValue
            }
        }
    }
    public var opacityOverlayColor: CGFloat? {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.opacityOverlayColor
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.opacityOverlayColor
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.opacityOverlayColor = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.opacityOverlayColor = newValue
            }
        }
    }
    public var animationBackgroundColor: Animation?
    {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.animationBackgroundColor
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.animationBackgroundColor
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.animationBackgroundColor = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.animationBackgroundColor = newValue
            }
        }
    }
    public var hideAnimation: Animation? {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.hideAnimation
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.hideAnimation
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.hideAnimation = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.hideAnimation = newValue
            }
        }
    }
    public var showAnimation: Animation? {
        get {
            if let fromStorage = storage[self.key] {
                return fromStorage.showAnimation
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                return storage[self.key]!.showAnimation
            }
        }
        set {
            if let _ = storage[self.key] {
                storage[self.key]?.showAnimation = newValue
            }
            else {
                storage[self.key] = .init(ownerModel: self.ownerModel)
                storage[self.key]?.showAnimation = newValue
            }
        }
    }

    public init(){
        self.init(ownerModel: nil)
    }
    public init(ownerModel: AnyObject?){
        self.init()
    }
}
