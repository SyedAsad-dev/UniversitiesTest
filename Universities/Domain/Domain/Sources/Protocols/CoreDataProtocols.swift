//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 08/05/2024.
//

import Foundation
import Entities

public protocol UniversityDataSource {
 func getAll()  throws -> UniversitiesListModel
 func create(todo: UniversitiesListModel)  throws -> ()
}
