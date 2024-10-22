//  CharacterDetailsRouterSpy.swift
//  Characters
//
//  Created by Ammar Elshamy on 22/10/2024.
//

import XCTest
@testable import Characters

final class CharacterDetailsRouterSpy: CharacterDetailsRouterProtocol {
    var popViewControllerCallsCount = 0
    var viewControllerToPop: UIViewController?
    
    func popViewController(_ viewController: UIViewController) {
        popViewControllerCallsCount += 1
        viewControllerToPop = viewController
    }
}
