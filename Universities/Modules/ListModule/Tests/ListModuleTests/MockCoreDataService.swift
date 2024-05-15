//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 15/05/2024.
//

import Foundation
import Entities
import Utils
import Protocols

struct MockCoreDataService: CoreDataRepositoryProtocol {
    
    var single: UniversitiesListModel
    var checkFailCondition: Bool
    init(model: UniversitiesListModel = [], checkFailCondition: Bool = false) {
        single = model
        self.checkFailCondition = checkFailCondition
    }
    func createList(_ todo: UniversitiesListModel)  ->  Result<Bool, CoreDataError>   {
            return .success(true)
    }
    
    func getList() -> Result<UniversitiesListModel, CoreDataError> {
        if !checkFailCondition {
            return .success(single)
        } else {
            return .failure(.DataSourceError)
        }
    }
}

