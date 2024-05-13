//
//  UniversityDetailModule.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit
import Utils
import Common
import Entities


public final class UniversityDetailModule {
    public var view: UniversityDetailViewProtocol
    public var router: UniversityDetailRouterProtocol
    public var interactor: UniversityDetailInteractorProtocol
    public var presenter: UniversityDetailPresenterProtocol
    
    public init(view: UniversityDetailViewProtocol = UniversityDetailViewController(),
         router: UniversityDetailRouterProtocol,
         interactor: UniversityDetailInteractorProtocol,
         presenter: UniversityDetailPresenterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.presenter = presenter
    }
    
}

extension UniversityDetailModule: PresentableDetailView {
    
    public func passData(model: Any, delegate: Any) {
        self.interactor = UniversityDetailInteractor(university: model as? UniversityModel)
        self.presenter = UniversityDetailPresenter(interactor: interactor, router: router, delegate: delegate as? UniversityDetailDelegate)
    }
    
    
    public func toPresent() -> UIViewController {
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        
        return view as! UIViewController
    }
}
