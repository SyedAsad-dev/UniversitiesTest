//
//  File.swift
//  
//
//  Created by Rizvi Naqvi on 13/05/2024.
//

import Foundation
import UIKit

public struct ConfigList {
    static public func createViewController() -> UniversityListViewController {
        let storyboard = UIStoryboard(name: "List", bundle: Bundle.module)
        return storyboard.instantiateInitialViewController() as! UniversityListViewController
    }
}
