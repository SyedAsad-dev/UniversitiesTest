//
//  UniversityDetailInteractor.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation

// MARK: - universityDetailInteractor
final class UniversityDetailInteractor: UniversityDetailInteractable {
    
    weak var presenter: UniversityDetailPresenterProtocol?
    
    private(set) var university: UniversityModel
    
    init(university: UniversityModel) {
        self.university = university
    }
    
}

// MARK: - Service Handler
extension UniversityDetailInteractor: UniversityDetailInteractorServiceHander {
    func updateUniversity(_ university: UniversityModel) {
        self.university = university
        presenter?.universityWasUpdated()
    }
}
