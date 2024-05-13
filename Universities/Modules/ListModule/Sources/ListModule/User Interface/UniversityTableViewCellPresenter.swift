//
//  UniversityTableViewCellPresenter.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation
import Entities

final class UniversityTableViewCellPresenter: UniversityTableViewCellPresenterProtocol {
    
    var view: UniversityTableViewCellProtocol?
    
    init(view: UniversityTableViewCellProtocol? = nil) {
        self.view = view
    }
    
    
    func configure(with university: UniversityModel) {
        view?.set(nameDescription: university.name)
        setPositionDescription(for: university)
        setSkillDescription(for: university)
    }
    
    private func setPositionDescription(for university: UniversityModel) {
        let country = university.country
        view?.set(positionDescription: "Country: \(country)")
    }
    
    private func setSkillDescription(for university: UniversityModel) {
        let code = university.alphaTwoCode
        view?.set(skillDescription: "Code: \(code)")
    }
    
}

