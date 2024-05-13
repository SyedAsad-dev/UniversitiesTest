//
//  UniversityDetailInteractor.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation
import Entities


// MARK: - universityDetailInteractor
public final class UniversityDetailInteractor: UniversityDetailInteractable {
    
    weak public var presenter: UniversityDetailPresenterProtocol?
    
    private(set) public var university: UniversityModel?
    
    public init(university: UniversityModel? = nil) {
        self.university = university
    }
    
}

// MARK: - Service Handler
extension UniversityDetailInteractor: UniversityDetailInteractorServiceHander {
    
    public func updateUniversity(_ university: UniversityModel) {
        self.university = university
        presenter?.universityWasUpdated()
    }
}
