/*

Project: SwiftUIAdditions
File: TransformSliderViewModel+Properties.swift
Created by: Егор Бойко
Date: 20.05.2023

Status: #In progress | #Not decorated

*/

import Foundation

extension TransformSliderViewModel {
    internal var geometryWidth: CGFloat {
        get {
            self._geometryWidth ?? 0
        }
        set {
            if self._geometryWidth == nil {
                _geometryWidth = newValue
            }
        }
    }
    
    internal var total: CGFloat {
        self.geometryWidth * self.current
    }
    
    internal var difference: CGFloat {
        self.total - self.offset
    }
    
    internal var endPoint: CGFloat {
        self.minimumDistance + 29
    }
}
