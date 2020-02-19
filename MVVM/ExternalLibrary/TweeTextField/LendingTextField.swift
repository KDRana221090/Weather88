//
//  TweeAttributedImageLendingTextField.swift
//  Weather88
//
//  Created by Apple on 16/07/19.
//  Copyright © 2019 kuldeep. All rights reserved.
//

import Foundation
import UIKit 

@IBDesignable
class TweeAttributedImageLendingTextField: TweeAttributedTextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            if let color = self.attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor {
                return color
            }
            return nil
        }
        set (setOptionalColor) {
            if let setColor = setOptionalColor {
                let string = self.placeholder ?? ""
                self.attributedPlaceholder = NSAttributedString(string: string , attributes:[NSAttributedString.Key.foregroundColor: setColor])
            }
        }
    }
    
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    private var _isRightViewVisible: Bool = true
    var isRightViewVisible: Bool {
        get {
            return _isRightViewVisible
        }
        set {
            _isRightViewVisible = newValue
            updateView()
        }
    }
    
    func updateView() {
        setLeftImage()
        setRightImage()
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?
            placeholder! :
            "", attributes:[NSAttributedString.Key.foregroundColor: tintColor])
    }
    
    func setLeftImage() {
        leftViewMode = UITextField.ViewMode.always
        var view: UIView
        
        if let image = leftImage {
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 15, width: 15, height: 15))
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = tintColor
            
            var width = imageView.frame.width + leftPadding-10
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 15
            }
            
            view = UIView(frame: CGRect(x: 0, y:15, width: width, height: 45))
            view.addSubview(imageView)
        } else {
            view = UIView(frame: CGRect(x: 0, y: 15, width: leftPadding, height: 20))
        }
        
        leftView = view
    }
    
    func setRightImage() {
        rightViewMode = UITextField.ViewMode.always
        
        var view: UIView
        
        if let image = rightImage, isRightViewVisible {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = tintColor
            
            var width = imageView.frame.width + rightPadding
            
            if borderStyle == UITextField.BorderStyle.none || borderStyle == UITextField.BorderStyle.line {
                width += 5
            }
            
            view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
        } else {
            view = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: 20))
        }
        
        rightView = view
    }
    
    
    //    // MARK: - Corner Radius
    //    @IBInspectable var cornerRadius: CGFloat = 0 {
    //        didSet {
    //            self.layer.cornerRadius = cornerRadius
    //        }
    //    }
}
