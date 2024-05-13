//
//  AlertHelper.swift
//  Universities
//
//  Created by Rizvi Naqvi on 07/05/2024.
//
import UIKit

public struct AlertHelper {
    static func present(in parent: UIViewController,
                        title: String,
                        message: String,
                        style: UIAlertController.Style = .alert,
                        actionTitle: String? = "OK",
                        actionStyle: UIAlertAction.Style = .default,
                        handler: (() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: actionTitle, style: actionStyle) { _ in
            handler?()
        }
        alertController.addAction(okAction)
        
        parent.present(alertController, animated: true, completion: nil)
    }
    
}

public protocol ErrorHandler {
    func handleError(title: String, message: String)
}


extension ErrorHandler where Self: UIViewController {
    public func handleError(title: String, message: String) {
        AlertHelper.present(in: self, title: title, message: message)
    }
}

