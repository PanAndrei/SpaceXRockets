//
//  MainView.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 09.04.2022.
//

import UIKit

class MainImageView: UIView {
    
    // MARK: - Properties
    
    var rocket: RocketViewModel? {
        didSet {
            updateValues()
        }
    }

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var rocketNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Pictures.settings.rawValue), for: .normal)
        return button
    }()
    
    private lazy var infoSubView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 25
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
        imageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 300)
        
        infoSubView.anchor(top: imageView.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: -25 ,height: 75)
        
        rocketNameLabel.centerY(inView: infoSubView, leftAncor: leftAnchor, paddingLeft: 24)
        settingsButton.centerY(inView: infoSubView, rightAnchor: rightAnchor, paddingRight: 24)
    }
    
    func updateValues() {
        if let rocket = rocket {
            rocketNameLabel.text = rocket.name
            
            if let url = rocket.imageURL {
                NetworkManager.shared.getImage(urlString: url) { data in
                    guard let data = data else { return }
                    
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            } else {
                self.imageView.image = UIImage(systemName: "antenna.radiowaves.left.and.right.slash")
            }
        }
    }
}
