//
//  LoginProtocol.swift
//  MVVM
//
//  Created by Apple on 17/02/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation

protocol LoginDelegate: AnyObject {
      func loginSuccessfull()
      func loginUnsuccessfull(_ title: String, _ message: String, _ buttonTitle: String)
}
