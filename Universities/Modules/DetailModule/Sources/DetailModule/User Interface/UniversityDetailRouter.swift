//
//  UniversityDetailRouter.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit
import Common
import Entities
import DetailsViewDelegate
import Utils

// MARK: - Router
public protocol UniversityDetailRouterProtocol: AnyObject, CommonNavigationService {
    func dissmissDetails()
}


public final class UniversityDetailRouter: UniversityDetailRouterProtocol {
    
    public var navigationController: UINavigationController?
    public var container: DIContainerService
    
    public init(container: DIContainerService, navigationController: UINavigationController? = nil) {
        self.container = container
        self.navigationController = navigationController
        registerViewControllers()
    }
    
}

extension UniversityDetailRouter {
    
    
//    public static func makeUniversityDetails() -> AnyObject {
//            let router = self UniversityDetailRouter(navigationController: navigationController)
//            let view: UniversityDetailViewController = Storyboard.defaultStoryboard.instantiateViewController()
//        let interactor = UniversityDetailInteractor(university: self.university!)
//        let presenter = UniversityDetailPresenter(interactor: interactor, delegate: self.delegate)
//
//            return UniversityDetailModule(view: view, router: self, interactor: interactor, presenter: presenter)
//    }

    private func registerViewControllers() {
        
//        let module = makeUniversityList(using: navigationController)
//        
//      
//        
////        if let viewController = module.assemble() {
////            navigationController.pushViewController(viewController, animated: true)
////        }
//        
//        container.register(type: PresentableListView.self) { container in
//            module.assemble()
//        }
    }
    
    public func dissmissDetails() {
        let appNavigationService = container.resolve(type: NavigationService.self)!
//        appNavigationService.showDetails(for: player, delegate: delegate)
        appNavigationService.dismissViewController(animated: true)
//        router?.dissmissRouteDetail()
    }
}
