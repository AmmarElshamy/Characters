//
//  UIImageView+LoadImage.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(with urlString: String?, placeholder: UIImage? = nil) {
        image = nil
        guard let urlString else { return }
        let url = URL(string: urlString)
        kf.setImage(with: url, placeholder: placeholder)
    }
}
