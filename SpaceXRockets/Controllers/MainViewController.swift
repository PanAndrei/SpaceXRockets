//
//  ViewController.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 09.04.2022.
//

import UIKit

// add settings save
// add description view

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    var pageIndex = 0
    var viewModel = RocketsPackViewModel()
    
    private lazy var mainImageView: MainImageView = {
        let view = MainImageView()
        view.settingsButton.addTarget(self, action: #selector(goToSettings), for: .touchUpInside)
        return view
    }()
    
    //
    let parameterCell = ParameterCell()
    //
    
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
        
        getRockets()
        
        setupView()
        
        
    }
    
    // MARK: - Helpers
    
    func getRockets() {
        viewModel.getRockets { _ in
            self.mainImageView.rocket = self.viewModel.rocketPack[self.pageIndex]
            
            //
//            self.parameterCell.rocket = self.viewModel.rocketPack[self.pageIndex]
            //
            
            self.parameterCell.parameters = self.viewModel.rocketPack[self.pageIndex].parameters
//            print(self.parameterCell.parameters![self.pageIndex][0])
//            print(self.parameterCell.parameters![self.pageIndex][1])
//            print(self.parameterCell.parameters![self.pageIndex][2])
            
            // передать параметр
            
            print(self.parameterCell.parameters?.count)
            self.parameterCell.parameter = self.parameterCell.parameters?[0]
            print(self.parameterCell.parameter)
            self.parameterCollectionView.reloadData()
        }
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(mainImageView)
        view.addSubview(parameterCollectionView)
        view.addSubview(descriptionScrollView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        mainImageView.anchor(top: view.topAnchor, left: view.leftAnchor,right: view.rightAnchor,
                             height: 350)
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
        navigationController?.pushViewController(LauchHistoryViewController(), animated: true)
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // worce unwrap
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParameterCell.identifier, for: indexPath) as? ParameterCell
        
//        //
////        let parameterCell = viewModel.rocketPack[pageIndex].parameters[indexPath.row]
//        let parameterCell = cell?.parameters?[indexPath.row]
//        cell?.parameter = parameterCell
//        //
//        DispatchQueue.main.async {
//            print(cell?.parameter?[0])
//
//        }
        
        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    
}


