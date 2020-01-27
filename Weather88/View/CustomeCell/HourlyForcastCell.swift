//
//  HourlyForcastCell.swift
//  Weather88
//
//  Created by Apple on 25/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import UIKit

class HourlyForcastCell: UICollectionViewCell {
    
    
    
    
    
    @IBOutlet var hours: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var temprature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
     }
    
    
    
    
    func fillCell(_ hourValue: String, _ averageTemp: String, _ weatherStatus: String) {
         self.hours.text = String(hourValue)
         self.temprature.text = averageTemp + "℃"
        
      //  print("wedcdcdcdcdc")
     //   print(weatherStatus)
         self.image.image = UIImage(named: weatherStatus)
    }
    
    
    
    
    
    
    
    
    

}
