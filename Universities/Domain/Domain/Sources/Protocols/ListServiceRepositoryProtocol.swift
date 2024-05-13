//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 08/05/2024.
//

import Entities
import Foundation
import Utils

public protocol APISRequestFetchable {
    func loadList(fromURL: URL,compeletion: @escaping (Result<UniversitiesListModel, NetworkError>) -> Void)
}
