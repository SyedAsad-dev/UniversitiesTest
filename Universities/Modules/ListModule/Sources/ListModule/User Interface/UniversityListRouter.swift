//
//  UniversityListRouter.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit
import Entities
import Utils
import Common

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
    }
    
}

extension UniversityListRouter {

    public func showDetails(for university: UniversityModel, delegate: UniversityDetailDelegate) {
        let appNavigationService = container.resolve(type: NavigationService.self)!
        appNavigationService.openDetailViewController(model: university, delegate: delegate)
    }
    
}

