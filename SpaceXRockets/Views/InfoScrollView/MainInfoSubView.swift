//
//  MainInfoSubView.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 13.04.2022.
//

import UIKit

class MainInfoSubView: UIView {
    
    // MARK: - Properties

    var valueLabelM: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Heplers

    func setupView() {
        backgroundColor = UIColor.cellBackgroundColor
        layer.cornerRadius = 20
        
        addSubview(valueLabelM)
        addSubview(descriptionLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        setDimensions(height: 80, width: 160)
        
        valueLabelM.centerX(inView: self, topAnchor: topAnchor, paddingTop: 16)
        descriptionLabel.centerX(inView: self, topAnchor: valueLabelM.bottomAnchor, paddingTop: 16)
    }
}
