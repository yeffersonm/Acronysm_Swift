//
//  MeaningTableViewCell.swift
//  Acronysm_IOS
//
//  Created by MacBooK Pro on 3/07/24.
//

import UIKit

class MeaningTableViewCell: UITableViewCell {
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tertiaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.selectionStyle = .none
        contentView.addSubview(mainLabel)
        contentView.addSubview(secondaryLabel)
        contentView.addSubview(tertiaryLabel)
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            secondaryLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 4),
            secondaryLabel.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            secondaryLabel.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor),
            
            tertiaryLabel.topAnchor.constraint(equalTo: secondaryLabel.bottomAnchor, constant: 4),
            tertiaryLabel.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            tertiaryLabel.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor),
            tertiaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: - Configuration
    func configure(dataMeaning:LfsResp) {
        mainLabel.text = dataMeaning.lf?.capitalized ?? ""
        secondaryLabel.text = "Frequency: \(dataMeaning.freq?.description ?? "")"
        tertiaryLabel.text = "Since: \(dataMeaning.since?.description ?? "")"
    }
}
