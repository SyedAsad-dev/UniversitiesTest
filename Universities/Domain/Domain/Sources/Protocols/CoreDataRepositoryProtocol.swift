//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 08/05/2024.
//

import Foundation
import Entities
import Utils

public protocol CoreDataRepositoryProtocol {
   func getList() -> Result<UniversitiesListModel, CoreDataError>
    @discardableResult func createList(_ list: UniversitiesListModel)  -> Result<Bool, CoreDataError>
}
