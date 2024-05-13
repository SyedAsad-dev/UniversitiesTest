//
//  UniversityTableViewCell.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit

final class UniversityTableViewCell: UITableViewCell, UniversityTableViewCellProtocol {
    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var skillLabel: UILabel!
    
    func set(nameDescription: String) {
        nameLabel.text = nameDescription
    }
    
    func set(positionDescription: String) {
        positionLabel.text = positionDescription
    }
    
    func set(skillDescription: String) {
        skillLabel.text = skillDescription
    }
    
}

