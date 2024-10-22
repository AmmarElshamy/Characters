//
//  UIView+LoadCustomViewNib.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import UIKit

public extension UIView {
    @discardableResult
    func loadCustomViewNib(nibName: String? = nil) -> UIView? {
        let name = nibName ?? Self.identifier
        guard let view = Bundle.main.loadNibNamed(name, owner: self)?.first as? UIView else {
            return nil
        }
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = bounds
        addSubview(view)
        return view
    }
}
