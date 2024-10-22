//
//  String+firstUppercased.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import Foundation

extension String {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
