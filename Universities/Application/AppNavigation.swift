//
//  AppNavigation.swift
//  MainApp
//
//  Created by Batikan Sosun on 14.03.2023.
//
import UIKit
import Foundation
import Common
import ListModule
import DetailModule

class AppNavigation: NavigationService, ExternalNavigationService {
    
    
    var navigationController: UINavigationController
    var container: DIContainerService
    
    init(navigationController: UINavigationController, container: DIContainerService) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func openListViewController() {
        let listNavigationService = container.resolve(type: PresentableListView.self)!
        let viewController = listNavigationService.toPresent()
        navigationController.show(viewController, sender: nil)
    }
    
    func openDetailViewController(model: Any, delegate: Any) {
        let detailNavigationService = container.resolve(type: PresentableDetailView.self)!
        detailNavigationService.passData(model: model, delegate: delegate)
       navigationController.show(detailNavigationService.toPresent(), sender: nil)
    }
    

    func dismissViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
}
