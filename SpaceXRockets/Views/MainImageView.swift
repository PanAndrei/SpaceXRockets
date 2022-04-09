//
//  MainView.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 09.04.2022.
//

import UIKit

class MainImageView: UIView {
    
    // MARK: - Properties
    
    private lazy var imageView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var rocketNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Falcon Heavy "
        return label
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "seal"), for: .normal)
        return button
    }()
    
    private lazy var infoSubView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func setupView() {
        backgroundColor = .black
        
        addSubview(imageView)
        
        addSubview(infoSubView)
        infoSubView.addSubview(rocketNameLabel)
        infoSubView.addSubview(settingsButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        imageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 200)

        infoSubView.anchor(top: imageView.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 100)
        
        rocketNameLabel.centerY(inView: infoSubView, leftAncor: leftAnchor, paddingLeft: 16)
        settingsButton.centerY(inView: infoSubView, rightAnchor: rightAnchor, paddingRight: 16)
    }
    
    // MARK: - Selectors
    
}
