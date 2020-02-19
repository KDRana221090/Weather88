//
//  BaseController.swift
//  Weather88
//
//  Created by Apple on 25/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import UIKit

class BaseController: UIViewController, UIGestureRecognizerDelegate, NVActivityIndicatorViewable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapGesture()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
      }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
   override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.hideLoader()
       self.navigationController?.setNavigationBarHidden(true, animated: true)
     }
    
   override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.hideLoader()
      }
    
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.setNavigationBarHidden(false, animated: false)
         
    }
    
    func addTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    public func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func showLoader(message: String="Loading") {
        let size = CGSize(width: 50, height:50)
        startAnimating(size, message: message, type: NVActivityIndicatorType.ballSpinFadeLoader, color: UIColor.white, padding: 0.0, displayTimeThreshold: nil, minimumDisplayTime: nil)
    }
    
    public func hideLoader() {
        stopAnimating()
    }
    
    
    
     
    
}
