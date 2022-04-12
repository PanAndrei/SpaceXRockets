//
//  ParameterCell.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 09.04.2022.
//

import UIKit

class ParameterCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    //
//    var idRow: Int?
//    var idRow = 0
    
    var parameters: [[String]]?
    
    var parameter: [String]? {
        didSet {
            if let parameter = parameter {
                descriptionLabel.text = "\(parameter[0]),  \(parameter[1])"
                valueLabel.text = parameter[2]
            }
        }
    }
    
    
    // forceunwrap
//    var rocket: RocketViewModel? {
//        didSet {
//            if let rocket = rocket {
////                descriptionLabel.text = "\(rocket.parameters[idRow!][0]),  \(rocket.parameters[idRow!][1])"
////                valueLabel.text = rocket.parameters[idRow!][2]
//
//               let destext = "\(rocket.parameters[idRow][0]),  \(rocket.parameters[idRow][1])"
//                let valtext = rocket.parameters[idRow][2]
//
//                descriptionLabel.text = "\(rocket.parameters[idRow][0]),  \(rocket.parameters[idRow][1])"
//                valueLabel.text = rocket.parameters[idRow][2]
//
//                print(destext)
//                print(valtext)
//            }
//        }
//    }
    //
    
    static var identifier: String = "ParameterCell"
    
    // settings change
    var measure = "kg"
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
//        label.text = "146"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
//        label.text = "weight, \(measure)"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sutupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func sutupCell() {
        backgroundColor = .gray
        
        addSubview(valueLabel)
        addSubview(descriptionLabel)
        
        setupConstraints()
    }

    func setupConstraints() {
        valueLabel.centerX(inView: self, topAnchor: topAnchor, paddingTop: 8)
        
        descriptionLabel.centerX(inView: self, topAnchor: valueLabel.bottomAnchor, paddingTop: 8)
        
    }
}
