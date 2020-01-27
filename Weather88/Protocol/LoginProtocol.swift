//
//  LoginProtocol.swift
//  Weather88
//
//  Created by Apple on 27/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation


protocol LoginDelegate: AnyObject {
    func handleLogin(_ result: Int)
}
