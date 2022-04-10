//
//  DescriptionScrollView.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 10.04.2022.
//

import UIKit

class DescriptionScrollView: UIView {
    
    private lazy var text1: UILabel = {
       let label = UILabel()
        label.text = "ljbsgkjhbsg"
        return label
    }()
    
    private lazy var text2: UILabel = {
       let label = UILabel()
        label.text = "ljbsgkjhbsg"
        return label
    }()
    
    private lazy var text3: UILabel = {
       let label = UILabel()
        label.text = "ljbsgkjhbsg"
        return label
    }()
    
    private lazy var text4: UILabel = {
       let label = UILabel()
        label.text = "ljbsgkjhbsg"
        return label
    }()
    
    private lazy var text5: UILabel = {
       let label = UILabel()
        label.text = "ljbsgkjhbsg"
        return label
    }()
    
    private lazy var text6: UILabel = {
       let label = UILabel()
        label.text = "ljbsgkjhbsg"
        return label
    }()
    
    let scrollView: UIScrollView = {
       let scrollV = UIScrollView()
        scrollV.backgroundColor = .cyan
        scrollV.contentSize = CGSize(width: 0, height: 2000)
        return scrollV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(scrollView)
        
        scrollView.addSubview(text1)
        scrollView.addSubview(text2)
        scrollView.addSubview(text3)
        scrollView.addSubview(text4)
        scrollView.addSubview(text5)
        scrollView.addSubview(text6)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        scrollView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        text1.anchor(top: scrollView.topAnchor)
        text2.anchor(top: text1.bottomAnchor, padddingTop: 150)
        text3.anchor(top: text2.bottomAnchor, padddingTop: 150)
        text4.anchor(top: text3.bottomAnchor, padddingTop: 150)
        text5.anchor(top: text4.bottomAnchor, padddingTop: 150)
        text6.anchor(top: text5.bottomAnchor, padddingTop: 150)
    }
}
