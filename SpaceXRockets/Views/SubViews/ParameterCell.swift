//
//  ParameterCell.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 09.04.2022.
//

import UIKit

//class ParameterCell: UICollectionViewCell {
//
//    // MARK: - Properties
//
//    var parameters: RocketViewModel? {
//        didSet {
////            print("parameters did set")
////            print(parameters?.name)
//
//            if let name = parameters?.name {
//
//            valueLabel.text = name
//            }
//        }
//    }
//
//    static var identifier: String = "ParameterCell"
//
//    // settings change
//    var measure = "kg"
//
//    private lazy var valueLabel: UILabel = {
//        let label = UILabel()
//        label.text = "146"
//        return label
//    }()
//
//    private lazy var descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.text = "weight, \(measure)"
//        return label
//    }()
//
//    // MARK: - Lifecycle
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        sutupCell()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: - Helpers
//
//    func sutupCell() {
//        backgroundColor = .gray
//
//        addSubview(valueLabel)
//        addSubview(descriptionLabel)
//
//        setupConstraints()
//    }
//
//    func setupConstraints() {
//        valueLabel.centerX(inView: self, topAnchor: topAnchor, paddingTop: 8)
//
//        descriptionLabel.centerX(inView: self, topAnchor: valueLabel.bottomAnchor, paddingTop: 8)
//
//    }
//}
