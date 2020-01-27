//
//  String+Extension.swift
//  Weather88
//
//  Created by Apple on 27/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
