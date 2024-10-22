//
//  UITableView+Register.swift
//  Characters
//
//  Created by Ammar Elshamy on 19/10/2024.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cell: T.Type) {
        register(UINib(nibName: cell.identifier, bundle: nil),
                 forCellReuseIdentifier: cell.identifier)
    }
}
