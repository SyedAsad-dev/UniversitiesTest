//
//  UniversityDetailTableViewCellPresenter.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import Foundation

struct UniversityDetailTableViewCellPresenter: UniversityDetailTableViewCellPresenterProtocol {
    var view: UniversityDetailTableViewCellProtocol?
    
    init(view: UniversityDetailTableViewCellProtocol? = nil) {
        self.view = view
    }
    
    func configure(with rowDetail: UniversityDetailRow) {
        view?.setLeftLabelText(rowDetail.title)
        view?.setRightLabelText(rowDetail.value)
    }
}

