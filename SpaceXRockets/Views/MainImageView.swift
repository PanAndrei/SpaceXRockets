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
            if let rocket = rocket {
                rocketNameLabel.text = rocket.name
                
                NetworkManager.shared.getImage(urlString: rocket.imageURL) { data in
                    guard let data = data else { return }
                    
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        return view
    }()
    
    //    private lazy var rocketNameLabel: UILabel = {
    private lazy var rocketNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "---"
        label.textColor = .white
        return label
    }()
    
    var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "seal"), for: .normal)
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
    
}


//
//
//

//extension UIView {
//   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        layer.mask = mask
//    }
//}
