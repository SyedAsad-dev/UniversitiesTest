//
//  UniversityServiceModel.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation

// MARK: - Temperature
public struct UniversityModel: Codable {
    public let stateProvince: String?
    public let domains: [String]
    public let webPages: [String]
    public let name: String
    public let alphaTwoCode: String
    public let country: String

    enum CodingKeys: String, CodingKey {
        case stateProvince = "state-province"
        case domains
        case webPages = "web_pages"
        case name
        case alphaTwoCode = "alpha_two_code"
        case country
    }
    public init(stateProvince: String?, domains: [String], webPages: [String], name: String, alphaTwoCode: String, country: String) {
        self.stateProvince = stateProvince
        self.domains = domains
        self.webPages = webPages
        self.name = name
        self.alphaTwoCode = alphaTwoCode
        self.country = country
    }
}

public typealias UniversitiesListModel = [UniversityModel]
