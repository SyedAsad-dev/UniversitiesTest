//
//  UniversityDetailPresenter.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation
import Common

// MARK: - PlayerDetailPresenter
public final class UniversityDetailPresenter: UniversityDetailPresentable {
    
    // MARK: - Properties
    public  weak var view: UniversityDetailViewProtocol?
    public var interactor: UniversityDetailInteractorProtocol
    public var router: UniversityDetailRouterProtocol
    public weak var delegate: UniversityDetailDelegate?
    public lazy var sections = makeSections()
    
    // MARK: - Init
    public init(view: UniversityDetailViewProtocol? = nil,
         interactor: UniversityDetailInteractorProtocol,
         router: UniversityDetailRouterProtocol,
         delegate: UniversityDetailDelegate? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegate = delegate
    }
    
    
    public func makeSections() -> [UniversityDetailSection] {
        [
            UniversityDetailSection(
                title: "Details",
                rows: [
                    UniversityDetailRow(title: "",
                                        value: interactor.university?.name ?? "",
                                    editableField: .name),
                    UniversityDetailRow(title: "Country",
                                        value: interactor.university?.stateProvince != nil ? "\(interactor.university!.stateProvince)" : "",
                                    editableField: .name),
                    UniversityDetailRow(title: "State",
                                    value: interactor.university?.country != nil ? "\(interactor.university!.country)" : "",
                                    editableField: .name),
                    UniversityDetailRow(title: "Code",
                                    value: interactor.university?.alphaTwoCode != nil ? "\(interactor.university!.alphaTwoCode)" : "",
                                    editableField: .name)
                ]
            ),
        ]
    }
    
}

// MARK: - View Configuration
extension UniversityDetailPresenter: UniversityDetailPresenterViewConfiguration {
    public func viewDidLoad() {
        let title = interactor.university?.name ?? ""
        view?.configureTitle(title)
        view?.setupBarButtonItem(title: "Reload")
        view?.setBarButtonState(isEnabled: true)
    }
    
    public func viewWillAppear() {
        view?.reloadData()
    }
}

// MARK: - Data Source
extension UniversityDetailPresenter: UniversityDetailDataSource {
    public var numberOfSections: Int {
        sections.count
    }
    
    public func numberOfRowsInSection(_ section: Int) -> Int {
        sections[section].rows.count
    }
    
    public func rowDetails(at indexPath: IndexPath) -> UniversityDetailRow {
        sections[indexPath.section].rows[indexPath.row]
    }
    
    public func titleForHeaderInSection(_ section: Int) -> String? {
        sections[section].title.uppercased()
    }
    
//    func selectRow(at indexPath: IndexPath) {
//        let university = interactor.university
//        let rowDetails = sections[indexPath.section].rows[indexPath.row]
//        let items = self.items(for: rowDetails.editableField)
//        let selectedItemIndex = items.firstIndex(of: rowDetails.value.lowercased())
//        let editableUniversityDetails = PlayerEditable(player: university,
//                                                   items: items,
//                                                   selectedItemIndex: selectedItemIndex,
//                                                   rowDetails: rowDetails)
//
////        router.showEditView(with: editablePlayerDetails, delegate: self)
//    }
    
//    private func items(for editableField: PlayerEditableFieldOption) -> [String] {
//        switch editableField {
//        case .position:
//            return PlayerPosition.allCases.map { $0.rawValue }
//
//        case .skill:
//            return PlayerSkill.allCases.map { $0.rawValue }
//
//        default:
//            return []
//        }
//    }
}

// MARK: - Service Handler
extension UniversityDetailPresenter: UniversityDetailPresenterServiceHandler {
    public func universityWasUpdated() {
        sections = makeSections()
        view?.configureTitle(interactor.university?.name ?? "")
        view?.reloadData()
    }
}

// MARK: - Actions
extension UniversityDetailPresenter: UniversityDetailPresenterActionable {
    public func selectUniversity() {
        delegate?.didUpdate()
        router.dissmissDetails()
    }
}
