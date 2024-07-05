//
//  Extension-UIViewController.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 3/07/24.
//

import UIKit

extension UIViewController {
    
    func presentAlert(
        style: AlertStyle = .info,
        title: String? = nil,
        message: String? = nil,
        actions: [AlertAction] = [.ok],
        preferredAction: AlertAction? = nil
    ) {
        let alertController = UIAlertController(
            title: title ?? style.title,
            message: message ?? style.message,
            preferredStyle: style.alertStyle
        )
        
        actions.map { $0.alertAction }.forEach(alertController.addAction)
        
        if let preferredAction = preferredAction {
            alertController.preferredAction = alertController.actions.first { $0.title == preferredAction.title }
        }
        
        present(alertController, animated: true)
    }
}
