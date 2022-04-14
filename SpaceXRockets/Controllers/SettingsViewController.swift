//
//  SettingsViewController.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 10.04.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    let defaults = UserDefaults.standard
    
    private let viewNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        return label
    }()
    
    private let buttonBack: UIButton = {
        let button = UIButton()
        let attributedTitle = NSMutableAttributedString(string: "Закрыть", attributes: [
            NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSMutableAttributedString.Key.foregroundColor: UIColor.white])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()
        
    private lazy var altitudeStack: SettingsStack = {
        let stack = SettingsStack(descr: "Высота", mes1: "m", mes2: "ft")
        stack.measureSwitcher.selectedSegmentIndex = defaults.integer(forKey: Settings.heigh.rawValue)
        stack.measureSwitcher.addTarget(self, action: #selector(saveSettings), for: .valueChanged)
        return stack
    }()
    
    private lazy var diameterStack: SettingsStack = {
        let stack = SettingsStack(descr: "Диаметр", mes1: "m", mes2: "ft")
        stack.measureSwitcher.selectedSegmentIndex = defaults.integer(forKey: Settings.diameter.rawValue)
        stack.measureSwitcher.addTarget(self, action: #selector(saveSettings), for: .valueChanged)
        return stack
    }()
    
    private lazy var weightStack: SettingsStack = {
        let stack = SettingsStack(descr: "Масса", mes1: "kg", mes2: "lb")
        stack.measureSwitcher.selectedSegmentIndex = defaults.integer(forKey: Settings.weight.rawValue)
        stack.measureSwitcher.addTarget(self, action: #selector(saveSettings), for: .valueChanged)
        return stack
    }()
    
    private lazy var payloadStack: SettingsStack = {
        let stack = SettingsStack(descr: "Полезная нагрузка", mes1: "kg", mes2: "lb")
        stack.measureSwitcher.selectedSegmentIndex = defaults.integer(forKey: Settings.payload.rawValue)
        stack.measureSwitcher.addTarget(self, action: #selector(saveSettings), for: .valueChanged)
        return stack
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [altitudeStack, diameterStack, weightStack, payloadStack])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Helpers
    
    func setupView() {
        view.backgroundColor = .gray

        view.addSubview(viewNameLabel)
        view.addSubview(buttonBack)
        view.addSubview(mainStack)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        viewNameLabel.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 16)
        
        // change equaly
        buttonBack.anchor(top: viewNameLabel.topAnchor, right: view.rightAnchor, paddingRight: 16)
        
        mainStack.anchor(top: viewNameLabel.topAnchor, left: view.leftAnchor, right: view.rightAnchor,
                         padddingTop: 200, height: 200)
        
        altitudeStack.anchor(left: mainStack.leftAnchor, right: mainStack.rightAnchor)
        diameterStack.anchor(left: mainStack.leftAnchor, right: mainStack.rightAnchor)
        weightStack.anchor(left: mainStack.leftAnchor, right: mainStack.rightAnchor)
        payloadStack.anchor(left: mainStack.leftAnchor, right: mainStack.rightAnchor)
        
    }
    
    // MARK: - Selectors
    
    @objc func goBack() {
        
        self.dismiss(animated: true, completion: nil)
    }
        
    @objc func saveSettings() {
        defaults.set(altitudeStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.heigh.rawValue)
        defaults.set(diameterStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.diameter.rawValue)
        defaults.set(weightStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.weight.rawValue)
        defaults.set(payloadStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.payload.rawValue)

        NotificationCenter.default.post(name: NSNotification.Name(Keys.notificationUpdade.rawValue), object: nil)
    }
    
//    @objc func changeAlt() {
//        defaults.set(altitudeStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.heigh.rawValue)
//
//        NotificationCenter.default.post(name: NSNotification.Name(Keys.notificationUpdade.rawValue), object: nil)
//    }
//
//    @objc func changeDiam() {
//        defaults.set(diameterStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.diameter.rawValue)
//
//        NotificationCenter.default.post(name: NSNotification.Name(Keys.notificationUpdade.rawValue), object: nil)
//    }
//
//    @objc func changeWeig() {
//        defaults.set(weightStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.weight.rawValue)
//
//        NotificationCenter.default.post(name: NSNotification.Name(Keys.notificationUpdade.rawValue), object: nil)
//
//    }
//
//    @objc func changePay() {
//        defaults.set(payloadStack.measureSwitcher.selectedSegmentIndex, forKey: Settings.payload.rawValue)
//
//        NotificationCenter.default.post(name: NSNotification.Name(Keys.notificationUpdade.rawValue), object: nil)
//
//    }
}

