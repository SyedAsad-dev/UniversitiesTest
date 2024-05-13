//
//  UniversityDetailModule.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit
import Utils

final class UniversityDetailModule {
    private var view: UniversityDetailViewProtocol
    private var router: UniversityDetailRouterProtocol
    private var interactor: UniversityDetailInteractorProtocol
    private var presenter: UniversityDetailPresenterProtocol
    
    init(view: UniversityDetailViewProtocol = UniversityDetailViewController(),
         router: UniversityDetailRouterProtocol = UniversityDetailRouter(),
         interactor: UniversityDetailInteractorProtocol,
         presenter: UniversityDetailPresenterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.presenter = presenter
    }
    
}

extension UniversityDetailModule: AppModule {
    func assemble() -> UIViewController? {
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        
        return view as? UIViewController
    }
}
