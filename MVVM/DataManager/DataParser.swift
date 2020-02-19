//
//  DataParser.swift
//  MVVM
//
//  Created by Apple on 18/02/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation

class DataParser {
    
 
    class func getType<T : Codable>(from data: Data) throws -> T {
         return try JSONDecoder().decode(T.self, from: data)
    }
    
 }
