/*
 
 Project: SwiftUIAdditions
 File: TransformSliderViewModel+Properties.swift
 Created by: Egor Boyko
 Date: 20.05.2023
 
 Status: #In progress | #Not decorated
 
 */

import Foundation

extension TransformSliderViewModel {
    var geometryWidth: CGFloat {
        get {
            self._geometryWidth ?? 0
        }
        set {
            if self._geometryWidth == nil {
                _geometryWidth = newValue
            }
        }
    }
    
    var total: CGFloat {
        self.geometryWidth * self.current
    }
    
    var difference: CGFloat {
        self.total - self.offset
    }
    
    var endPoint: CGFloat {
        self.minimumDistance + 29
    }
}
