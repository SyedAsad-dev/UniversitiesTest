//
//  UniversityDetailSection.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation

public struct UniversityDetailSection {
    let title: String
    let rows: [UniversityDetailRow]
}

public struct UniversityDetailRow {
    let title: String
    let value: String
    let editableField: UniversityEditableFieldOption
}

public enum UniversityEditableFieldOption {
    case name
}
