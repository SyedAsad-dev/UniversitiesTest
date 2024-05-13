//
//  UniversityDetailProtocols.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation

// MARK: - Router
protocol UniversityDetailRouterProtocol: AnyObject {
    func dissmissDetails()
}

// MARK: - View
typealias UniversityDetailViewProtocol = UniversityDetailViewable & UniversityDetailViewConfigurable & UniversityDetailViewReloadable

protocol UniversityDetailViewable: AnyObject {
    var presenter: UniversityDetailPresenterProtocol! { get set }
}

protocol UniversityDetailViewConfigurable: AnyObject {
    func configureTitle(_ title: String)
    func setupBarButtonItem(title: String)
    func setBarButtonState(isEnabled: Bool)
    func setBarButtonTitle(_ title: String)
    func setViewInteraction(_ enabled: Bool)
}

protocol UniversityDetailViewReloadable: AnyObject {
    func reloadData()
}

protocol UniversityDetailTableViewCellProtocol: AnyObject {
    func setLeftLabelText(_ text: String)
    func setRightLabelText(_ text: String)
}

// MARK: - Delegate
protocol UniversityDetailDelegate: AnyObject {
    func didUpdate()
}

// MARK: - Presenter
typealias UniversityDetailPresenterProtocol = UniversityDetailPresentable & UniversityDetailDataSource & UniversityDetailPresenterViewConfiguration & UniversityDetailPresenterServiceHandler & UniversityDetailPresenterActionable

protocol UniversityDetailPresentable: AnyObject {
    var view: UniversityDetailViewProtocol? { get set }
    var interactor: UniversityDetailInteractorProtocol { get set }
    var router: UniversityDetailRouterProtocol { get set }
    var delegate: UniversityDetailDelegate? { get set }
}

protocol UniversityDetailPresenterActionable: AnyObject {
    func selectUniversity()
}


protocol UniversityDetailDataSource: AnyObject {
    var numberOfSections: Int { get }
    
    func numberOfRowsInSection(_ section: Int) -> Int
    func rowDetails(at indexPath: IndexPath) -> UniversityDetailRow
    func titleForHeaderInSection(_ section: Int) -> String?
//    func selectRow(at indexPath: IndexPath)
}

protocol UniversityDetailPresenterViewConfiguration: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
}

protocol UniversityDetailPresenterServiceHandler: AnyObject {
    func universityWasUpdated()
}

protocol UniversityDetailTableViewCellPresenterProtocol {
    var view: UniversityDetailTableViewCellProtocol? { get set }
    
    func configure(with rowDetail: UniversityDetailRow)
}

// MARK: - Interactor
typealias UniversityDetailInteractorProtocol = UniversityDetailInteractable & UniversityDetailInteractorServiceHander

protocol UniversityDetailInteractable: AnyObject {
    var presenter: UniversityDetailPresenterProtocol? { get set }
}

protocol UniversityDetailInteractorServiceHander: AnyObject {
    var university: UniversityModel { get }
    
    func updateUniversity(_ university: UniversityModel)
}
