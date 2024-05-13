//
//  UniversityDetailProtocols.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation
import Entities
import DetailsViewDelegate
import Common


// MARK: - View
public typealias UniversityDetailViewProtocol = UniversityDetailViewable & UniversityDetailViewConfigurable & UniversityDetailViewReloadable

public protocol UniversityDetailViewable: AnyObject {
    var presenter: UniversityDetailPresenterProtocol! { get set }
}

public protocol UniversityDetailViewConfigurable: AnyObject {
    func configureTitle(_ title: String)
    func setupBarButtonItem(title: String)
    func setBarButtonState(isEnabled: Bool)
    func setBarButtonTitle(_ title: String)
    func setViewInteraction(_ enabled: Bool)
}

public protocol UniversityDetailViewReloadable: AnyObject {
    func reloadData()
}

public protocol UniversityDetailTableViewCellProtocol: AnyObject {
    func setLeftLabelText(_ text: String)
    func setRightLabelText(_ text: String)
}


// MARK: - Presenter
public typealias UniversityDetailPresenterProtocol = UniversityDetailPresentable & UniversityDetailDataSource & UniversityDetailPresenterViewConfiguration & UniversityDetailPresenterServiceHandler & UniversityDetailPresenterActionable

public protocol UniversityDetailPresentable: AnyObject {
    var view: UniversityDetailViewProtocol? { get set }
    var interactor: UniversityDetailInteractorProtocol { get set }
    var router: UniversityDetailRouterProtocol { get set }
    var delegate: UniversityDetailDelegate? { get set }
}

public protocol UniversityDetailPresenterActionable: AnyObject {
    func selectUniversity()
}


public protocol UniversityDetailDataSource: AnyObject {
    var numberOfSections: Int { get }
    
    func numberOfRowsInSection(_ section: Int) -> Int
    func rowDetails(at indexPath: IndexPath) -> UniversityDetailRow
    func titleForHeaderInSection(_ section: Int) -> String?
//    func selectRow(at indexPath: IndexPath)
}

public protocol UniversityDetailPresenterViewConfiguration: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
}

public protocol UniversityDetailPresenterServiceHandler: AnyObject {
    func universityWasUpdated()
}

public protocol UniversityDetailTableViewCellPresenterProtocol {
    var view: UniversityDetailTableViewCellProtocol? { get set }
    
    func configure(with rowDetail: UniversityDetailRow)
}

// MARK: - Interactor
public typealias UniversityDetailInteractorProtocol = UniversityDetailInteractable & UniversityDetailInteractorServiceHander

public protocol UniversityDetailInteractable: AnyObject {
    var presenter: UniversityDetailPresenterProtocol? { get set }
}

public protocol UniversityDetailInteractorServiceHander: AnyObject {
    var university: UniversityModel? { get }
    
    func updateUniversity(_ university: UniversityModel)
}
