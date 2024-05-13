// The Swift Programming Language
// https://docs.swift.org/swift-book
import UIKit

public protocol CommonNavigationService {
    var container: DIContainerService { get set }
    var navigationController: UINavigationController? { get set }
}

// MARK: - Delegate
public protocol UniversityDetailDelegate: AnyObject {
    func didUpdate()
}

