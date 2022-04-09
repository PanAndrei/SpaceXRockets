//
//  ViewController.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 09.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let mainImageView = MainImageView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    // MARK: - Helpers
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(mainImageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        mainImageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 300)
    }

}

