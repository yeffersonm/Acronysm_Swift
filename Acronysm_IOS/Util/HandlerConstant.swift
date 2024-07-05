//
//  HandlerConstant.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 3/07/24.
//

import UIKit

enum AlertStyle {
    case info
    case network
    case internalError
    case warning
    case error
    case custom(UIAlertController.Style)
    
    var alertStyle: UIAlertController.Style {
        switch self {
        case .info, .warning, .error, .internalError, .network:
            return .alert
        case .custom(let style):
            return style
        }
    }
    
    var title: String {
        switch self {
        case .info:
            return "Información"
        case .warning:
            return "Advertencia"
        case .error:
            return "Error"
        case .custom:
            return ""
        case .network:
            return "Sin conexion a internet"
        case .internalError:
            return "Error interno"
        }
    }
    
    var message: String {
        switch self {
        case .info, .warning, .error, .custom:
            return ""
        case .network:
            return "No detectamos conexion a internet por favor verifique su conexion"
        case .internalError:
            return "Error interno por favor intente mas tarde."
        }
    }
}

enum AlertAction {
    case ok
    case cancel
    case custom(title: String, style: UIAlertAction.Style = .default, handler: (() -> Void)? = nil)
    
    var alertAction: UIAlertAction {
        switch self {
        case .ok:
            return UIAlertAction(title: "OK", style: .default)
        case .cancel:
            return UIAlertAction(title: "Cancelar", style: .cancel)
        case .custom(let title, let style, let handler):
            return UIAlertAction(title: title, style: style) { _ in handler?() }
        }
    }
    
    var title: String {
        switch self {
        case .ok:
            return "OK"
        case .cancel:
            return "Cancelar"
        case .custom(let title, _, _):
            return title
        }
    }
}
