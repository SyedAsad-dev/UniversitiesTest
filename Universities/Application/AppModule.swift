//
//  AppModule.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit
import ListModule
import Entities
import Utils


protocol ModuleFactoryProtocol {
    func makeUniversityList(using navigationController: UINavigationController) -> UniversityListModule
    func makeUniversityDetails(using navigationController: UINavigationController,
                           for university: UniversityModel,
                           delegate: UniversityDetailDelegate) -> UniversityDetailModule
}

struct ModuleFactory: ModuleFactoryProtocol {

    func makeUniversityList(using navigationController: UINavigationController = UINavigationController()) -> UniversityListModule {
        let router = UniversityListRouter(navigationController: navigationController, moduleFactory: self)
        let view: UniversityListViewController = Storyboard.defaultStoryboard.instantiateViewController()
        view.presenter = UniversityListPresenter()
        return UniversityListModule(view: view, router: router)
    }
    
    func makeUniversityDetails(using navigationController: UINavigationController = UINavigationController(),
                           for university: UniversityModel,
                           delegate: UniversityDetailDelegate) -> UniversityDetailModule {
        let router = UniversityDetailRouter(navigationController: navigationController, moduleFactory: self)
        let view: UniversityDetailViewController = Storyboard.defaultStoryboard.instantiateViewController()
        let interactor = UniversityDetailInteractor(university: university)
        let presenter = UniversityDetailPresenter(interactor: interactor, delegate: delegate)
        
        return UniversityDetailModule(view: view, router: router, interactor: interactor, presenter: presenter)
    }
    
   
}

