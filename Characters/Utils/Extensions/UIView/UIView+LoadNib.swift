//
//  UIView+LoadNib.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import UIKit

public extension UIView {
    static func loadNib() -> Self? {
        Bundle.main.loadNibNamed(identifier, owner: nil, options: nil)?.first as? Self
    }
}
