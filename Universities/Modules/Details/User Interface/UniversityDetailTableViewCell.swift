//
//  UniversityDetailTableViewCell.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit

final class UniversityDetailTableViewCell: UITableViewCell, UniversityDetailTableViewCellProtocol {
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    func setLeftLabelText(_ text: String) {
        leftLabel.text = text
    }
    
    func setRightLabelText(_ text: String) {
        rightLabel.text = text
    }
}

