//
//  InfoLabelsStack.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 10.04.2022.
//

import UIKit

class InfolabelsStack: UIStackView {
    
    // MARK: - Properties
    
    var descriptionT: String?
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = descriptionT
        return label
    }()
    
     var valueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Lifecycle

    init(descr: String) {
        super.init(frame: .zero)
        self.descriptionT = descr
        
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func setupView() {
        backgroundColor = .green
        
        addSubview(descriptionLabel)
        addSubview(valueLabel)
        
        setupConstraints()
    }

    func setupConstraints() {        
        descriptionLabel.centerY(inView: self, leftAncor: leftAnchor, paddingLeft: 16)
        valueLabel.centerY(inView: self, rightAnchor: rightAnchor, paddingRight: 16)
    }

}
