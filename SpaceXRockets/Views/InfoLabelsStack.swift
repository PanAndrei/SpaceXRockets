//
//  InfoLabelsStack.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 10.04.2022.
//

import UIKit

class InfolabelsStack: UIView {
    
    // MARK: - Properties
    
    var descriptionT: String {
        didSet {
            descriptionLabel.text = descriptionT
        }
    }
    var value: String {
        didSet {
            valueLabel.text = value
        }
    }
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "description"
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "value"
        return label
    }()
    
    private lazy var descriptionStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [descriptionLabel, valueLabel])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        return stack
    }()
    
    // MARK: - Lifecycle

    init(description: String, value: String) {
        super.init(frame: .zero)
        self.descriptionT = description
        self.value = value
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func setupView() {
        
    }


}
