//
//  CharacterDetailsRouter.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import UIKit

// MARK: - Protocol
protocol CharacterDetailsRouterProtocol {
    func popViewController(_ view: UIViewController)
}

// MARK: - Router
final class CharacterDetailsRouter: CharacterDetailsRouterProtocol {
    func popViewController(_ view: UIViewController) {
        view.navigationController?.popViewController(animated: true)
    }
}
