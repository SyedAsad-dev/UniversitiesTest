//
//  UniversityListProtocols.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation
import Entities
import Utils



// MARK: - View
public typealias UniversityListViewProtocol = UniversityListViewable & Loadable & Emptyable & UniversityListViewConfigurable & ErrorHandler & UniversityListViewReloadable

public protocol UniversityListViewable: AnyObject {
    var presenter: UniversityListPresenterProtocol? { get set }
}

public protocol UniversityListViewConfigurable: AnyObject {
    func configureTitle(_ title: String)
    func setupTableView()
    func setViewInteraction(_ enabled: Bool)
}

public protocol UniversityListViewReloadable: AnyObject {
    func reloadData()
}

public protocol UniversityTableViewCellProtocol: AnyObject {
    func set(nameDescription: String)
    func set(positionDescription: String)
    func set(skillDescription: String)
}

// MARK: - Presenter
public typealias UniversityListPresenterProtocol = UniversityListPresentable & UniversityListPresenterViewConfiguration & UniversityListDataSource & UniversityListPresenterServiceInteractable & UniversityListPresenterRetryable & UniversityListPresenterServiceHandler & UniversityListPresenterActionable

public protocol UniversityListPresentable: AnyObject {
    var view: UniversityListViewProtocol? { get set }
    var interactor: UniversityListInteractorProtocol { get set }
    var router: UniversityListRouterProtocol { get set }
}

public protocol UniversityListPresenterViewConfiguration: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
}

public protocol UniversityListDataSource: AnyObject {
    var numberOfRows: Int { get }
    func cellPresenter(at index: Int) -> UniversityTableViewCellPresenterProtocol
    func university(at index: Int) -> UniversityModel
    func selectRow(at index: Int)
}

public protocol UniversityListPresenterServiceInteractable: AnyObject {
    func loadUniversities()
}

public protocol UniversityListPresenterServiceHandler: AnyObject {
    func serviceFailedWithError(_ error: Error)
    func universityListDidLoad()
}

public protocol UniversityListPresenterRetryable: AnyObject {
    func retry()
}

public protocol UniversityListPresenterActionable: AnyObject {
    func selectUniversities()
}

public protocol UniversityTableViewCellPresenterProtocol: AnyObject {
    var view: UniversityTableViewCellProtocol? { get set }
    func configure(with university: UniversityModel)

}

// MARK: - Interactor
public typealias UniversityListInteractorProtocol = UniversityListInteractable & UniversityListInteractorServiceHander

public protocol UniversityListInteractable: AnyObject {
    var presenter: UniversityListPresenterProtocol? { get set }
}

public protocol UniversityListInteractorServiceHander: AnyObject {
    var universities: UniversitiesListModel{ get set }
    
    func loadUniversities()
}

// MARK: - PlayerListViewStateDetails
public protocol UniversityListViewStateDetails {
    var barButtonItemTitle: String { get }
}

