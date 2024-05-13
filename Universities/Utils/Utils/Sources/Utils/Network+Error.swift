//
//  Network+Error.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation

public enum NetworkError: LocalizedError {
    case badRequest(String)
    case noData
    case failedToParseData
    case invalidResponse
    case invalidStatusCode(Int)
    public var errorDescription: String? {
        switch self {
        case .failedToParseData:
            return "Technical decoding difficulty, we can't Parse the data"
        case let .badRequest(messageError):
            return messageError
        case .invalidResponse:
            return "invalid Response"
        case let .invalidStatusCode(statusCode):
            return "invalid Response with status Code \(statusCode)"
        default:
            return "Something went wrong"
        }
    }
}


