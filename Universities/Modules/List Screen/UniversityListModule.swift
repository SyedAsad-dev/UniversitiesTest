//
//  UniversityListModule.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit

final class UniversityListModule {
    
    private var view: UniversityListViewProtocol
    private var router: UniversityListRouterProtocol
    private var interactor: UniversityListInteractorProtocol
    private var presenter: UniversityListPresenterProtocol
    
    init(view: UniversityListViewProtocol = UniversityListViewController(),
         router: UniversityListRouterProtocol = UniversityListRouter(),
         interactor: UniversityListInteractorProtocol = UniversityListInteractor(),
         presenter: UniversityListPresenterProtocol = UniversityListPresenter()) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.presenter = presenter
    }
    
}

extension UniversityListModule: AppModule {
    func assemble() -> UIViewController? {
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        
        return view as? UIViewController
    }
}

