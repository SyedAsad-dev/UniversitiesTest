//
//  CoreDataRepository.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//


import Foundation
import Entities
import Protocols
import Utils

public struct CoreDataRepository: CoreDataRepositoryProtocol {
    
   public init(dataSource: UniversityDataSource) {
        self.dataSource = dataSource
    }

    var dataSource: UniversityDataSource

    public func createList(_ todo: UniversitiesListModel)  ->  Result<Bool, CoreDataError>   {
        do{
            try  dataSource.create(todo: todo)
            return .success(true)
        }catch{
            return .failure(.CreateError)
        }

    }
    
    
   public func getList()  -> Result<UniversitiesListModel, CoreDataError> {
        do{
            let _todos =  try  dataSource.getAll()
            return .success(_todos)
        }catch{
            return .failure(.FetchError)
        }
    }
}
