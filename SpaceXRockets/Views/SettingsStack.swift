//
//  SettingsStack.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 10.04.2022.
//

import UIKit

class SettingsStack: UIStackView {
    
    // MARK: - Properties
    
    var descriptionS: String?
    var measure1: String?
    var measure2: String?
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = descriptionS
        return label
    }()
    
    lazy var measureSwitcher: UISegmentedControl = {
        let items = [measure1, measure2]
        
        let switcher = UISegmentedControl(items: items)
        switcher.layer.cornerRadius = 5
        switcher.backgroundColor = .orange
        switcher.tintColor = .green
        return switcher
    }()
    
    // MARK: - Lyfecycle
    
    init(descr: String, mes1: String, mes2: String) {
        super.init(frame: .zero)
        
        self.descriptionS = descr
        self.measure1 = mes1
        self.measure2 = mes2
        
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func setupView() {
        backgroundColor = .green
        
        addSubview(descriptionLabel)
        addSubview(measureSwitcher)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        descriptionLabel.centerY(inView: self, leftAncor: leftAnchor, paddingLeft: 16)
        
        measureSwitcher.centerY(inView: self, rightAnchor: rightAnchor, paddingRight: 16)
    }
}
