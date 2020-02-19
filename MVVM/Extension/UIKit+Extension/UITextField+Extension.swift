//
//  UITextField.swift
//  India1
//
//  Created by Apple on 04/05/19.
//  Copyright © 2019 kuldeep. All rights reserved.
//

import Foundation
import UIKit


public extension UITextField {
    func setInactiveTextBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    
    func setActiveTextBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.appTextColor().cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 2.0
        self.layer.shadowRadius = 0.0
    }
    
 
}

