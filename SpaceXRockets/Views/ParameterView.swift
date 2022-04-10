////
////  ParameterView.swift
////  SpaceXRockets
////
////  Created by Andrei Panasenko on 09.04.2022.
////
//
//import UIKit
//
//class ParameterView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
//
//   let layout = UICollectionViewFlowLayout()
//
//    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(frame: frame, collectionViewLayout: layout)
//
//        setupView()
//        setupLayout()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupView() {
//        backgroundColor = .brown
//        register(ParameterCell.self, forCellWithReuseIdentifier: ParameterCell.identifier)
////        dataSource = self
////        delegate = self
//    }
//
//    func setupLayout() {
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 100, height: 100)
//        layout.minimumLineSpacing = 50
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParameterCell.identifier, for: indexPath)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize.init(width: frame.width, height: 250)
//        }
//
//}
//
//
