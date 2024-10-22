//
//  UIView+Indentifier.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import UIKit

public extension UIView {
    class var identifier: String {
        String(describing: self)
    }
}
