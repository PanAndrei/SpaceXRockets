//
//  DescriptionScrollView.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 10.04.2022.
//

import UIKit

class DescriptionScrollView: UIView {
    
    // MARK: - Properties
    
    var rocket: RocketViewModel? {
        didSet {
            updateValue()
        }
    }

    private lazy var text1: InfolabelsStack = {
        let stack = InfolabelsStack(descr: "Первый запуск")
        return stack
    }()
    
    private lazy var text2: InfolabelsStack = {
        let stack = InfolabelsStack(descr: "Страна")
        return stack
    }()
    
    private lazy var text3: InfolabelsStack = {
        let stack = InfolabelsStack(descr: "Стоимость запуска")
        return stack
    }()
    
    private lazy var textFS: UILabel = {
        let label = UILabel()
        label.text = "ПЕРВАЯ СТУПЕНЬ"
        return label
    }()
    
    private lazy var text4: InfolabelsStack = {
        let stack = InfolabelsStack(descr: "Количество двигателей")
        return stack
    }()
    
    private lazy var text5: InfolabelsStack = {
        let stack = InfolabelsStack(descr: "Количество топлива")
        return stack
    }()
    
    private lazy var text6: InfolabelsStack = {
        let stack = InfolabelsStack(descr: "Время сгорания")
        return stack
    }()
    
    private lazy var textSS: UILabel = {
        let label = UILabel()
        label.text = "ВТОРАЯ СТУПЕНЬ"
        return label
    }()
    
    private lazy var text7: InfolabelsStack = {
        let stack = InfolabelsStack(descr: "Количество двигателей")
        return stack
    }()
    
    private lazy var text8: InfolabelsStack = {
        let stack = InfolabelsStack(descr: "Количество топлива")
        return stack
    }()
    
    private lazy var text9: InfolabelsStack = {
        let stack = InfolabelsStack(descr: "Время сгорания")
        return stack
    }()
    
//    private lazy var showLaunchesButton: UIButton = {
     var showLaunchesButton: UIButton = {
        let button = UIButton()
        button.setTitle("show lauches", for: .normal)
         button.backgroundColor = UIColor.cellBackgroundColor
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.backgroundColor = .black
        scrollV.contentSize = CGSize(width: 40, height: 1300)
        return scrollV
    }()
    
    // MARK: - Lyficycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers

    func setupView() {
        addSubview(scrollView)

        scrollView.addSubview(text1)
        scrollView.addSubview(text2)
        scrollView.addSubview(text3)
        scrollView.addSubview(textFS)
        scrollView.addSubview(text4)
        scrollView.addSubview(text5)
        scrollView.addSubview(text6)
        scrollView.addSubview(textSS)
        scrollView.addSubview(text7)
        scrollView.addSubview(text8)
        scrollView.addSubview(text9)
        scrollView.addSubview(showLaunchesButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        scrollView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        text1.anchor(top: scrollView.topAnchor, left: leftAnchor, right: rightAnchor, height: 60)
        text2.anchor(top: text1.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: 50, height: 60)
        text3.anchor(top: text2.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: 50, height: 60)
        textFS.anchor(top: text3.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: 50, height: 60)
        text4.anchor(top: textFS.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: 50, height: 60)
        text5.anchor(top: text4.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: 50, height: 60)
        text6.anchor(top: text5.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: 50, height: 60)
        textSS.anchor(top: text6.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: 50, height: 60)
        text7.anchor(top: textSS.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: 50, height: 60)
        text8.anchor(top: text7.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: 50, height: 60)
        text9.anchor(top: text8.bottomAnchor, left: leftAnchor, right: rightAnchor, padddingTop: 50, height: 60)
        
        showLaunchesButton.centerX(inView: scrollView, topAnchor: text9.bottomAnchor, paddingTop: 50)
        showLaunchesButton.setDimensions(height: 50, width: 100)
    }
    
    func updateValue() {
        if let rocket = rocket {
            text1.valueLabel.text = rocket.firstFlight
            text2.valueLabel.text = rocket.country
            text3.valueLabel.text = rocket.costPerLaunch
            text4.valueLabel.text = rocket.firstStageEng
            text5.valueLabel.text = rocket.firstStageFuel
            text6.valueLabel.text = rocket.firstStageBurnTime
            text7.valueLabel.text = rocket.secondStageEng
            text8.valueLabel.text = rocket.secondStageFuel
            text9.valueLabel.text = rocket.secondStageBurnTime
        }
    }
}