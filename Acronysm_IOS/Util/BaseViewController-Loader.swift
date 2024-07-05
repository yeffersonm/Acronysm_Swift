//
//  BaseViewController-Loader.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 3/07/24.
//

import UIKit


protocol BaseLoadingViewProtocol: AnyObject {
    func showLoader()
    func hideLoader()
}

public final class Indicator {
    public static let shared = Indicator()
    
    private lazy var blurView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .red
        return indicator
    }()
    
    private init() {}
    
    public func show(in view: UIView) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.blurView.frame = view.bounds
            self.indicator.center = self.blurView.center
            view.addSubview(self.blurView)
            view.addSubview(self.indicator)
            self.indicator.startAnimating()
        }
    }
    
    public func hide() {
        DispatchQueue.main.async { [weak self] in
            self?.indicator.stopAnimating()
            self?.blurView.removeFromSuperview()
            self?.indicator.removeFromSuperview()
        }
    }
}

extension BaseViewController: BaseLoadingViewProtocol {
    func showLoader() {
        Indicator.shared.show(in: self.view)
    }
    
    func hideLoader() {
        Indicator.shared.hide()
    }
    
}
