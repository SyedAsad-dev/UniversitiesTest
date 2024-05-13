//
//  Loadable.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//


import UIKit

public protocol Loadable {
    var loadingView: LoadingView { get }
    
    func showLoadingView()
    func hideLoadingView()
}

extension Loadable where Self: UIViewController {
    public func showLoadingView() {
        view.isUserInteractionEnabled = false
        loadingView.show()
    }
    
    public func hideLoadingView() {
        view.isUserInteractionEnabled = true
        view.endEditing(true)
        loadingView.hide()
    }
}

extension Loadable where Self: UIView {
    public  func showLoadingView() {
        isUserInteractionEnabled = false
        loadingView.show()
    }
    
    public  func hideLoadingView() {
        isUserInteractionEnabled = true
        endEditing(true)
        loadingView.hide()
    }
}

