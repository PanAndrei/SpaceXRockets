//
//  ViewController.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 09.04.2022.
//

import UIKit

// add settings save

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    var pageTitle = ""
    var pageIndex = 0
    
    private lazy var mainImageView: MainImageView = {
       let view = MainImageView()
        view.rocketNameLabel.text = pageTitle
        view.settingsButton.addTarget(self, action: #selector(goToSettings), for: .touchUpInside)
        return view
    }()
    
    private lazy var parameterCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.itemSize = CGSize(width: 100, height: 100)
        viewLayout.minimumLineSpacing = 50
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .brown
        collectionView.register(ParameterCell.self, forCellWithReuseIdentifier: ParameterCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    private lazy var descriptionScrollView: DescriptionScrollView = {
        let view = DescriptionScrollView()
        view.showLaunchesButton.addTarget(self, action: #selector(goToLaunch), for: .touchUpInside)
        return view
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupView()
        
        print(pageTitle)
    }
    
    // MARK: - Helpers
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(mainImageView)
        view.addSubview(parameterCollectionView)
        view.addSubview(descriptionScrollView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        mainImageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor,
                             height: 300)
        
        parameterCollectionView.anchor(top: mainImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                                       height: 120)
        
        descriptionScrollView.anchor(top: parameterCollectionView.bottomAnchor, left: view.leftAnchor,
                                     bottom: view.bottomAnchor, right: view.rightAnchor)
        
    }
    
    // MARK: - Selectors
    
    @objc func goToSettings() {
        let settingsVC = SettingsViewController()
        self.present(settingsVC, animated: true)
    }
    
    @objc func goToLaunch() {
        let launchVC = LauchHistoryViewController()
        launchVC.modalPresentationStyle = .fullScreen
        self.present(launchVC, animated: true)
//        navigationController?.pushViewController(LauchHistoryViewController(), animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParameterCell.identifier, for: indexPath)
        return cell
    }
    
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return 1
    //    }
    
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    
}


