//
//  Emptyable.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//

import UIKit

public protocol Emptyable {
    var emptyView: EmptyView { get }
    
    func showEmptyView()
    func hideEmptyView()
}

public typealias EmptyViewable = Emptyable & EmptyViewDelegate

