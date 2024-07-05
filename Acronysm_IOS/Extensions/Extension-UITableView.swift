//
//  Extension-UITableView.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 3/07/24.
//

import UIKit

extension UITableView {
    func setEmptyMessage(_ message: String = "No se encontraron resultados.") {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.font = UIFont.boldSystemFont(ofSize: 20)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        backgroundView = messageLabel
        separatorStyle = .none
    }
    
    func restore() {
        backgroundView = nil
        separatorStyle = .singleLine
    }
}
