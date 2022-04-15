//
//  Extensions.swift
//  SpaceXRockets
//
//  Created by Andrei Panasenko on 09.04.2022.
//

import UIKit

extension NSAttributedString {
    class func setTwoColorsString(str1: String, str2: String = "      ") -> NSMutableAttributedString {
        let atrStr1 = NSMutableAttributedString(string: str1, attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ])
        let atrStr2 = NSMutableAttributedString(string: (" " + str2), attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor.lightGray
        ])
        atrStr1.append(atrStr2)
        return atrStr1
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}

extension String {
    func getFormattedDateString(oldFormat: String, newFormat: String) -> String {
        let stringDateFormatter = DateFormatter()
        stringDateFormatter.dateFormat = oldFormat
        let date = stringDateFormatter.date(from: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = newFormat
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date ?? Date())
    }
}

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let cellBackgroundColor = UIColor.rgb(red: 33, green: 33, blue: 33)
}

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? =  nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                padddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, bottomAnchor: NSLayoutYAxisAnchor? = nil,
                 paddingTop: CGFloat = 0, paddingBottom: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let top = topAnchor {
            anchor(top: topAnchor, padddingTop: paddingTop)
        }
        
        if let bottom = bottomAnchor {
            anchor(bottom: bottomAnchor, paddingBottom: paddingBottom)
        }
    }
    
    func centerY(inView view: UIView, leftAncor: NSLayoutXAxisAnchor? = nil, rightAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, paddingRight: CGFloat = 0,constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAncor {
            anchor(left: leftAncor, paddingLeft: paddingLeft)
        }
        
        if let right = rightAnchor {
            anchor(right: rightAnchor, paddingRight: paddingRight)
        }
    }
    
}
