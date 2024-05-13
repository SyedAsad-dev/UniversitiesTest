//
//  View+Extensions.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit

extension UIView {
    static func instanceFromNib<T>() -> T? {
        return UINib(nibName: String(describing: T.self), bundle: Bundle.module).instantiate(withOwner: nil, options: nil).first as? T
    }
}

