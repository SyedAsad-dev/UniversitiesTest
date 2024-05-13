//
//  UniversityListInteractor.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation
import Entities
import Utils
import Protocols

// MARK: - PlayerListInteractor
public final class UniversityListInteractor: UniversityListInteractable {
    
    public var listService: APISRequestFetchable
    public var listCoreData: CoreDataRepositoryProtocol
    public  weak var presenter: UniversityListPresenterProtocol?
    public var universities: UniversitiesListModel
    
    
    public init(listService: APISRequestFetchable,
         listCoreData: CoreDataRepositoryProtocol,
         universities: UniversitiesListModel = []) {
        self.universities = universities
        self.listService = listService
        self.listCoreData = listCoreData
    }
    
}

// MARK: - Service Handler
extension UniversityListInteractor: UniversityListInteractorServiceHander {
     
    public  func loadUniversities() {
        guard let url = Common.prepareURL(suffixURL: Constants.listApi, key: Constants.listApiKey, value: Constants.listApiValue) else {return }
        listService.loadList(fromURL: url) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    if let CoreDataResult = self?.listCoreData.getList () {
                        switch CoreDataResult {
                        case .failure(let error):
                            self?.presenter?.serviceFailedWithError(error)
                        case .success(let universities):
                            self?.universities = universities
                            self?.presenter?.universityListDidLoad()
                        }
                    } else {
                        self?.presenter?.serviceFailedWithError(error)
                    }
                case .success(let universities):
                    self?.universities = universities
                    self?.presenter?.universityListDidLoad()
                    self?.listCoreData.createList(universities)
                }
            }
        }
        
    }
    
}

