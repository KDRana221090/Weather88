//
//  DisplayAlertController.swift
//  Weather88
//
//  Created by Apple on 25/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//


import Foundation
import UIKit


public class DisplayAlertController: NSObject {
    
    
    static let getInstance = DisplayAlertController()
    private override init(){}
    
    /*
     * Basic alert controller with no action
     * Pass these parameter: Title, Message,and a controller
     * showBasicAlertWithNoAction(title: "", message: "", buttonText: "", controller: self)
     */
    
    func showBasicAlertWithNoAction(title: String, message: String, buttonText: String, controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: nil))
        controller.present(alert, animated: true)
    }
    
    
    
    /*
     * Basic alert controller with one action
     * Pass these parameter: Title, Message, button gtext and a controller
     * showBasicAlertWithOneAction(title: "", message: "", buttonText: "", controller: self) { (flag) in }
     
     */
    
    func showBasicAlertWithOneAction(title: String, message: String, buttonText: String, controller:UIViewController, completedWithBtnStr: @escaping (_ actionResponse: Bool) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonText, style: .default, handler: { action in
            completedWithBtnStr(true)
        }))
        controller.present(alertController, animated: true)
    }
    
    
    func showBasicAlertWithOneAction1(title: String, message: String, buttonText: String, controller:UIViewController, completedWithBtnStr: ((_ actionResponse: Bool) -> Void)?=nil ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonText, style: .default, handler: { action in
            completedWithBtnStr?(true)
        }))
        controller.present(alertController, animated: true)
    }
    
    
    /*
     * Basic alert controller with two action
     * Pass these parameter: Title, Message, two button text and a controller
     * showBasicAlertWithThreeAction(title: "", message: "", buttonText: "", controller: self) { (value) in }
     */
    
    func showBasicAlertWithTwoAction(title: String, message: String, firstButtonText: String, secondButtonText: String, controller:UIViewController, completedWithBtnStr: @escaping (_ actionResponse: Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: firstButtonText, style: .default, handler: { action in
            completedWithBtnStr(0)
        }))
        alertController.addAction(UIAlertAction(title: secondButtonText, style: .default, handler: { action in
            completedWithBtnStr(1)
        }))
        controller.present(alertController, animated: true)
    }
    
    
    
    
    
    
    /*
     * Basic alert controller with three action
     * Pass these parameter: Title, Message, three button text and a controller
     * showBasicAlertWithThreeAction(title: "", message: "", buttonText: "", controller: self) { (value) in }
     */
    
    func showBasicAlertWithThreeAction(title: String, message: String, firstButtonText: String, secondButtonText: String, thirdButtonText: String, controller:UIViewController, completedWithBtnStr: @escaping (_ actionResponse: Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: firstButtonText, style: .default, handler: { action in
            completedWithBtnStr(0)
        }))
        alertController.addAction(UIAlertAction(title: secondButtonText, style: .default, handler: { action in
            completedWithBtnStr(1)
        }))
        alertController.addAction(UIAlertAction(title: thirdButtonText, style: .default, handler: { action in
            completedWithBtnStr(2)
        }))
        controller.present(alertController, animated: true)
    }
    
  }
