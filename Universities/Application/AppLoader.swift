//
//  AppLoader.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit

struct AppLoader {
    private let window: UIWindow
    private let navigationController: UINavigationController
    private let moduleFactory: ModuleFactoryProtocol
    
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds),
         navigationController: UINavigationController = UINavigationController(),
         moduleFactory: ModuleFactoryProtocol = ModuleFactory()) {
        self.window = window
        self.navigationController = navigationController
        self.moduleFactory = moduleFactory
    }
    
    func build() {
        let module = moduleFactory.makeUniversityList(using: navigationController)
        let viewController = module.assemble()
        setRootViewController(viewController)
    }
    
    private func setRootViewController(_ viewController: UIViewController?) {
        window.rootViewController = navigationController
        
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: true)
        }
        
        window.makeKeyAndVisible()
    }
}
