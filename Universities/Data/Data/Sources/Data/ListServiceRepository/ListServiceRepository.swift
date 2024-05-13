//
//  ListService.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//


import Foundation
import Entities
import Protocols
import Utils

protocol Fetchable {
   func fetch<T: Decodable>(fromURL url: URLRequest, completion: @escaping ((Result<T, NetworkError>) -> Void))
}


public class RequestAPI {
    private let session: URLSession
   public init(session: URLSession = .shared) {
        self.session = session
    }

}

public extension RequestAPI {
    func requiredRequest(fromURL url: URL) throws -> URLRequest {
        return URLRequest(url: url)
    }
}


extension RequestAPI: APISRequestFetchable, Fetchable {
    
   public func loadList(fromURL: URL, compeletion: @escaping (Result<UniversitiesListModel, NetworkError>) -> Void) {
        do {
            // Request data from the backend
            guard let request = try? self.requiredRequest(fromURL: fromURL) else {
                compeletion(.failure(.badRequest("Not valid URL")))
                return
            }
            
            fetch(fromURL: request) { (result: Result<UniversitiesListModel, NetworkError>) in
                switch result {
                case .success(let response):
                    compeletion(.success(response))
                case .failure(let error):
                    compeletion(.failure(error))
                }
             }
        }
    }
}

