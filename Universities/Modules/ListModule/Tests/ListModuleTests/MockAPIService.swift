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

struct MockAPIService: APISRequestFetchable {
    
    var single: UniversitiesListModel
    var testCoreData: Bool
    
    init(model: UniversitiesListModel = [], testCoreData: Bool = false) {
        single = model
        self.testCoreData = testCoreData
    }
    
    public func loadList(fromURL: URL, compeletion: @escaping (Result<UniversitiesListModel, NetworkError>) -> Void) {
         do {
             
             if !testCoreData {
                 compeletion(.success(single))
             } else {
                 compeletion(.failure(.noData))
             }
        }
     }
}
