//
//  LaunchTableViewCell.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 11.04.2022.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var launches: LaunchViewModel? {
        didSet {
            if let launches = launches {
                launchNameLabel.text = launches.name
            }
        }
    }
    
    // clipstobouds
    
    private lazy var launchNameLabel: UILabel = {
       let label = UILabel()
//        label.text = "name of launch"
        return label
    }()
    
    private lazy var launchDateLabel: UILabel = {
       let label = UILabel()
        label.text = "date of launch"
        return label
    }()

    private lazy var launchImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "airplane.departure")
        return view
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupView() {
        backgroundColor = .purple
//        layer.cornerRadius = 10
        
        addSubview(launchNameLabel)
        addSubview(launchDateLabel)
        addSubview(launchImage)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        launchNameLabel.anchor(top: topAnchor, left: leftAnchor, padddingTop: 18, paddingLeft: 18)
        launchDateLabel.anchor(top: launchNameLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, padddingTop: 18, paddingLeft: 18, paddingBottom: 18)
        launchImage.centerY(inView: self, rightAnchor: rightAnchor, paddingRight: 32)
    }
}
