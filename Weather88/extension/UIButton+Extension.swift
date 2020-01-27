//
//  UIButton+Extension.swift
//  Weather88
//
//  Created by Apple on 25/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension UIButton {
    
    
    func setButtonRadius(radius:CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func setButtonTitle(title:String) {
        self.setTitle(title, for: .normal)
    }
    
    func setButtonTitleColor(titleColor:UIColor) {
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
    
    
    
    
 }
