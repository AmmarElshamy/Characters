//
//  CharactersRouter.swift
//  Characters
//
//  Created by Ammar Elshamy on 21/10/2024.
//

import UIKit

// MARK: - Protocol
protocol CharactersRouterProtocol {
    func navigateToCharacterDetails(from view: UIViewController, with id: Int)
}

// MARK: - Router
final class CharactersRouter: CharactersRouterProtocol {
    func navigateToCharacterDetails(from view: UIViewController, with id: Int) {
        let viewController = CharacterDetailsBuilder.createModule(with: id)
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}
