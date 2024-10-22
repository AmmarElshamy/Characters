//
//  UITableView+Dequeue.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(cellFor indexPath: IndexPath) -> T? {
        dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
}
