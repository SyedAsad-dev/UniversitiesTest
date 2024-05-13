//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/05/2024.
//

import Foundation
import UIKit

public struct ConfigDetail {
    static public func createViewController() -> UniversityDetailViewController {
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle.module)
        return storyboard.instantiateInitialViewController() as! UniversityDetailViewController
    }
}   
