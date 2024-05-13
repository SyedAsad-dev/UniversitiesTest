//
//  AppLoad.swift
//  Universities
//
//  Created by Rizvi Naqvi on 13/05/2024.
//

import Foundation
import UIKit
import Common
import ListModule
import DetailModule
import Data


class AppLoad {
    private let window: UIWindow
    private let navigationController: UINavigationController
    var appNavigationService: NavigationService?
    
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds),
         navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        registerModuleNavigation()
    }
    
    func build() {
        setRootViewController()
    }
    
    private func setRootViewController() {
        window.rootViewController = navigationController
        appNavigationService?.openListViewController()
        window.makeKeyAndVisible()
    }
    
    private func registerModuleNavigation() {
  
        let container = DIContainer()
        container.register(type: NavigationService.self) { _ in
            AppNavigation(navigationController: self.navigationController, container: container)
        }
        
        container.register(type: PresentableListView.self) { _ in
            
            let router = UniversityListRouter(container: container, navigationController: self.navigationController)
            let view: UniversityListViewController = ConfigList.createViewController()
            let interactor = UniversityListInteractor(listService: RequestAPI(), listCoreData: CoreDataRepository(dataSource: UniversityCoreDataSourceImpl()))
            let presenter = UniversityListPresenter(interactor: interactor, router: router)
            
            view.presenter = presenter
            
            return UniversityListModule(view: view, router: router, interactor: interactor, presenter: presenter)
        }
        
        container.register(type: PresentableDetailView.self) { _ in
            let router = UniversityDetailRouter(container: container, navigationController: self.navigationController)
            let view: UniversityDetailViewController = ConfigDetail.createViewController()
            let interactor = UniversityDetailInteractor()
            let presenter = UniversityDetailPresenter(interactor: interactor, router: router)
            
            return UniversityDetailModule(view: view, router: router, interactor: interactor, presenter: presenter)
        }
        appNavigationService = container.resolve(type: NavigationService.self)!
    }
}
