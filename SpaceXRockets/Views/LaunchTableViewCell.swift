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
                launchDateLabel.text = launches.date
                launchImage.image = UIImage(named: launches.picture)
            }
        }
    }
    
    private lazy var launchNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private lazy var launchDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var launchImage: UIImageView = {
        let view = UIImageView()
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
        backgroundColor = UIColor.cellBackgroundColor
        
        addSubview(launchNameLabel)
        addSubview(launchDateLabel)
        addSubview(launchImage)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        launchNameLabel.anchor(top: topAnchor, left: leftAnchor, padddingTop: 24, paddingLeft: 24)
        launchDateLabel.anchor(top: launchNameLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor,
                               padddingTop: 16, paddingLeft: 24, paddingBottom: 24)
        launchImage.centerY(inView: self, rightAnchor: rightAnchor, paddingRight: 32)
    }
}
