//
//  UIView+IsCircular.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import UIKit

extension UIView {
    var isCircular: Bool {
        get {
            layer.cornerRadius == frame.height / 2
        }
        set {
            if newValue {
                layer.cornerRadius = frame.height / 2
                clipsToBounds = true
            }
        }
    }
}
