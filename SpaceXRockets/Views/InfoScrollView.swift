//
//  InfoScrollView.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 13.04.2022.
//

import UIKit

class InfoScrollView: UIView {
    
    // MARK: - Properties
    
    var rocket: RocketViewModel? {
        didSet {
            updateValues()
        }
    }
    
    private lazy var heightLabel: MainInfoSubView = {
        let label = MainInfoSubView()
        return label
    }()
    
    private lazy var diameterLabel: MainInfoSubView = {
        let label = MainInfoSubView()
        return label
    }()
    
    private lazy var weightLabel: MainInfoSubView = {
        let label = MainInfoSubView()
        return label
    }()
    
    private lazy var payloadLabel: MainInfoSubView = {
        let label = MainInfoSubView()
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.backgroundColor = .black
        scrollV.contentSize = CGSize(width: 720, height: 100)
        return scrollV
    }()
    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateView),
                                               name: NSNotification.Name(Keys.notificationUpdade.rawValue), object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func setupView() {
        backgroundColor = .yellow
        
        addSubview(scrollView)
        
        scrollView.addSubview(heightLabel)
        scrollView.addSubview(diameterLabel)
        scrollView.addSubview(weightLabel)
        scrollView.addSubview(payloadLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        scrollView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        heightLabel.centerY(inView: scrollView, leftAncor: scrollView.leftAnchor, paddingLeft: 16)
        diameterLabel.centerY(inView: scrollView, leftAncor: heightLabel.rightAnchor, paddingLeft: 16)
        weightLabel.centerY(inView: scrollView, leftAncor: diameterLabel.rightAnchor, paddingLeft: 16)
        payloadLabel.centerY(inView: scrollView, leftAncor: weightLabel.rightAnchor, paddingLeft: 16)
    }
    
    func updateValues() {
        if let rocket = rocket {
            // force unwrap
            heightLabel.valueLabelM.text = rocket.heighValue![0]
            heightLabel.descriptionLabel.text = rocket.heighValue![1]
            
            diameterLabel.valueLabelM.text = rocket.diameterValue![0]
            diameterLabel.descriptionLabel.text = rocket.diameterValue![1]
            
            weightLabel.valueLabelM.text = rocket.massValue![0]
            weightLabel.descriptionLabel.text = rocket.massValue![1]
            
            payloadLabel.valueLabelM.text = rocket.payloadValue![0]
            payloadLabel.descriptionLabel.text = rocket.payloadValue![1]
        }
    }
    
    @objc func updateView() {
        updateValues()
    }
}
