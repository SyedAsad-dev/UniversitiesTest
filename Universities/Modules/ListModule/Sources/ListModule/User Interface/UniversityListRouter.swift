//
//  UniversityListRouter.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit
import Entities
import Utils
import DetailsViewDelegate
import Common

//public protocol LoginNavigationService {
//    var container: DIContainerService { get set }
//    var navigationController: UINavigationController? { get set }
//    func openLoginViewController()
//    func openPhoneUpdateViewController()
//    
//    func openBasketViewController()
//}
//
//public class LoginNavigation: LoginNavigationService {
//    public var container: CoreModule.DIContainerService
//    public var navigationController: UINavigationController?
//    
//    public init(container: CoreModule.DIContainerService,
//                navigationController: UINavigationController? = nil) {
//        self.container = container
//        self.navigationController = navigationController
//        registerViewControllers()
//    }
//    
//    private func registerViewControllers() {
//        container.register(type: PresentableLoginView.self) { container in
//            LoginViewController(navigationService: container.resolve(type: LoginNavigationService.self)!)
//        }
//    }
//    
//    public func openLoginViewController() {
//        let viewController = container.resolve(type: PresentableLoginView.self)!
//        navigationController?.show(viewController.toPresent(), sender: nil)
//    }
//    
//    public func openPhoneUpdateViewController() {
//        
//    }
//    
//    public func openBasketViewController() {
//        let appNavigationService = container.resolve(type: NavigationService.self)!
//        appNavigationService.openBasketViewController()
//    }
//    
//}

// MARK: - Router
public protocol UniversityListRouterProtocol: AnyObject, CommonNavigationService {
    func showDetails(for university: UniversityModel, delegate: UniversityDetailDelegate)
}


public final class UniversityListRouter: UniversityListRouterProtocol {
    
    public var navigationController: UINavigationController?
    public var container: DIContainerService

    public init(container: DIContainerService,
                navigationController: UINavigationController? = nil) {
        self.container = container
        self.navigationController = navigationController
        registerViewControllers()
    }
    
}

extension UniversityListRouter {
    
//    private static func makeUniversityList(using navigationController: UINavigationController = UINavigationController(),
//                           for university: UniversityModel,
//                           delegate: UniversityDetailDelegate) -> AnyObject {
//        let router = UniversityListRouter(navigationController: navigationController)
//        let view: UniversityListViewController = Storyboard.defaultStoryboard.instantiateViewController()
//        let interactor = UniversityListInteractor(university: university)
//        let presenter = UniversityListPresenter(interactor: interactor, delegate: delegate)
//        
//        return UniversityListModule(view: view, router: router as! UniversityDetailRouterProtocol, interactor: interactor, presenter: presenter)
//    }

    private func registerViewControllers() {
//        let module = container.resolve(type: AppModule.self)!
//        container.register(type: PresentableListView.self) { container in
//            module.assemble()
//        }
    }
    
    
//    public func openBasketViewController() {
//        let appNavigationService = container.resolve(type: NavigationService.self)!
//        appNavigationService.showDetails(for: <#T##UniversityModel#>, delegate: <#T##UniversityDetailDelegate#>)
//    }


    public func showDetails(for university: UniversityModel, delegate: UniversityDetailDelegate) {
//        let module = route.makeUniversityDetails(using: navigationController, for: player, delegate: delegate)
//        
//        if let viewController = module.assemble() {
//            navigationController.pushViewController(viewController, animated: true)
//        }
        
        let appNavigationService = container.resolve(type: NavigationService.self)!
//        appNavigationService.showDetails(for: player, delegate: delegate)
        appNavigationService.openDetailViewController(model: university, delegate: delegate)
    }
    
}

