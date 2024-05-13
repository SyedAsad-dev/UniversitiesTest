//
//  UniversityListModule.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit
import Utils
import Common

public final class UniversityListModule {
    
    public var view: UniversityListViewProtocol
    public var router: UniversityListRouterProtocol
    public var interactor: UniversityListInteractorProtocol
    public var presenter: UniversityListPresenterProtocol
    
    public init(view: UniversityListViewProtocol,
         router: UniversityListRouterProtocol,
         interactor: UniversityListInteractorProtocol,
         presenter: UniversityListPresenterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.presenter = presenter

    }
    
}

extension UniversityListModule: PresentableListView {
    public func toPresent() -> UIViewController {
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        view.presenter = presenter
        
        return view as! UIViewController
    }

}

