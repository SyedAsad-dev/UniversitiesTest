//
//  UniversityDetailRouter.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit

final class UniversityDetailRouter {
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
    
}

extension UniversityDetailRouter: UniversityDetailRouterProtocol {
    func dissmissDetails() {
        navigationController.popViewController(animated: true)
    }
}
