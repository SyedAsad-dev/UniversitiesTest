//
//  UniversityListPresenter.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation
import Entities
import Common

// MARK: - PlayerListPresenter
public final class UniversityListPresenter: UniversityListPresentable {
    
    // MARK: - Properties
    public weak var view: UniversityListViewProtocol?
    public var interactor: UniversityListInteractorProtocol
    public var router: UniversityListRouterProtocol
    
    public var cellPresenters: [Int: UniversityTableViewCellPresenterProtocol] = [:]
    public var selectedRows: Set<Int> = []
    
    // MARK: - Public API
    public init(view: UniversityListViewProtocol? = nil,
         interactor: UniversityListInteractorProtocol,
         router: UniversityListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

// MARK: - View Configuration
extension UniversityListPresenter: UniversityListPresenterViewConfiguration {
    public func viewDidLoad() {
        view?.configureTitle(title)
        view?.setupTableView()
        loadUniversities()
    }
    
    private var title: String {
       
            return "Universities List"

    }
    
    private var universityCollectionIsEmpty: Bool {
        interactor.universities.isEmpty
    }
    
    public func viewWillAppear() {
        view?.reloadData()
    }
}

// MARK: - Interactor
extension UniversityListPresenter: UniversityListPresenterServiceInteractable {
    public func loadUniversities() {
        view?.setViewInteraction(false)
        interactor.loadUniversities()
    }
}

// MARK: - Retry
extension UniversityListPresenter: UniversityListPresenterRetryable {
    public func retry() {
        view?.hideEmptyView()
        loadUniversities()
    }
}

// MARK: - Service Handler
extension UniversityListPresenter: UniversityListPresenterServiceHandler {
    public func serviceFailedWithError(_ error: Error) {
        view?.setViewInteraction(true)
        view?.handleError(title: "Error", message: String(describing: error))
    }
    
    public func universityListDidLoad() {
        view?.setViewInteraction(true)
        showEmptyViewIfRequired()
        view?.reloadData()
    }
    
    private func showEmptyViewIfRequired() {
        if universityCollectionIsEmpty {
            view?.showEmptyView()
        } else {
            view?.hideEmptyView()
        }
    }

}

// MARK: - Actions
extension UniversityListPresenter: UniversityListPresenterActionable {
    public func selectUniversities() {
        configureView()
        view?.reloadData()
    }
    
    private func configureView() {
        view?.configureTitle(title)
    }
    
    private var actionButtonIsEnabled: Bool {
        return true
    }
    
    
}

// MARK: - Data Source
extension UniversityListPresenter: UniversityListDataSource {
    
    public var numberOfRows: Int { interactor.universities.count }
    
    
    public func cellPresenter(at index: Int) -> UniversityTableViewCellPresenterProtocol {
        if let cellPresenter = cellPresenters[index] {
//            cellPresenter.viewState = viewState
            return cellPresenter
        }
        
        let cellPresenter = UniversityTableViewCellPresenter()
        cellPresenters[index] = cellPresenter
        
        return cellPresenter
    }
    
    public func university(at index: Int) -> UniversityModel {
        interactor.universities[index]
    }
    
    public func selectRow(at index: Int) {
        guard universityCollectionIsEmpty == false else {
            return
        }
            let university = interactor.universities[index]
            showDetailsView(for: university)
    }
    
    private func showDetailsView(for university: UniversityModel) {
        router.showDetails(for: university, delegate: self)
    }
    
}

// MARK: - PlayerEditDelegate
extension UniversityListPresenter: UniversityDetailDelegate {
    public func didUpdate() {
        interactor.loadUniversities()
    }
}

