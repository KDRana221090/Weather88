//
//  UIButton+Extension.swift
//  India1
//
//  Created by Apple on 25/04/19.
//  Copyright © 2019 kuldeep. All rights reserved.
//

import Foundation
import UIKit


  public extension UIButton {
    
    func setRadius(radius:CGFloat) {
        self.layer.cornerRadius = radius
     }
    
    func setTitle(title:String) {
        self.setTitle(title, for: .normal)
    }
    
    func setTitleColor(titleColor:UIColor) {
        self.setTitleColor(titleColor, for: .normal)
      }
    
    
    func setAppBtnBGColor(backgrondcolor:UIColor) {
        self.backgroundColor = backgrondcolor
    }
    
    func makeRoundButton() {
       self.layer.cornerRadius = self.bounds.height/2
    }
    
    
    func tileFontSizeWithStyle(fontName: String, fontSize: CGFloat) {
        self.titleLabel?.font =  UIFont(name: fontName, size: fontSize)
     }
    
    func disableButton() {
        self.isEnabled = false
        self.isUserInteractionEnabled = false
        self.alpha = 0.4
        self.setTitleColor(.white, for: .normal)
        }
    
    func enableButton() {
        self.isEnabled = true
        self.isUserInteractionEnabled = true
        self.alpha = 1.0
        self.setTitleColor(.white, for: .normal)
    }
    
    func applyGradiantEffect(firstColor: UIColor, secondColor: UIColor) {
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = self.frame.size
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.3, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.addSublayer(gradientLayer)
      }
    
}
