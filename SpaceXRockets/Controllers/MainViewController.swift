//
//  ViewController.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 09.04.2022.
//

import UIKit

// add description view

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    var pageIndex = 0
    var viewModel = RocketsPackViewModel()
    
    private lazy var mainImageView: MainImageView = {
        let view = MainImageView()
        view.settingsButton.addTarget(self, action: #selector(goToSettings), for: .touchUpInside)
        return view
    }()
    
    private lazy var infoScrollView: InfoScrollView = {
        let view = InfoScrollView()
        return view
    }()
    
    private lazy var descriptionScrollView: DescriptionScrollView = {
        let view = DescriptionScrollView()
        view.showLaunchesButton.addTarget(self, action: #selector(goToLaunch), for: .touchUpInside)
        return view
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRockets()
        
        setupView()
    }
    
    // MARK: - Helpers
    
    func getRockets() {
        viewModel.getRockets { _ in
            self.mainImageView.rocket = self.viewModel.rocketPack[self.pageIndex]
            self.infoScrollView.rocket = self.viewModel.rocketPack[self.pageIndex]
            self.descriptionScrollView.rocket = self.viewModel.rocketPack[self.pageIndex]
        }
    }
    
    func setupView() {
//        self.navigationController?.navigationBar.tintColor = .white
        
        view.backgroundColor = .black
        
        view.addSubview(mainImageView)
        view.addSubview(infoScrollView)
        view.addSubview(descriptionScrollView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        mainImageView.anchor(top: view.topAnchor, left: view.leftAnchor,right: view.rightAnchor,
                             height: 350)
        
        infoScrollView.anchor(top: mainImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                              height: 100)
        
        descriptionScrollView.anchor(top: infoScrollView.bottomAnchor, left: view.leftAnchor,
                                     bottom: view.bottomAnchor, right: view.rightAnchor)
        
    }
    
    // MARK: - Selectors
    
    @objc func goToSettings() {
        let settingsVC = SettingsViewController()
        self.present(settingsVC, animated: true)
        
//        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    @objc func goToLaunch() {
        //
        let vc = LauchHistoryViewController()
        // force
        vc.rocket = viewModel.rocketPack[self.pageIndex].id!
        
        //
        navigationController?.pushViewController(vc, animated: true)
//        navigationController?.pushViewController(LauchHistoryViewController(), animated: true)

    }
}
