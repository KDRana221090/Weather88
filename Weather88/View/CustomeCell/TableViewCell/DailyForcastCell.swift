//
//  DailyForcastCell.swift
//  Weather88
//
//  Created by Apple on 25/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import UIKit

class DailyForcastCell: UITableViewCell {
    
    
    
    @IBOutlet var day: UILabel!
    @IBOutlet var WeatherImage: UIImageView!
    @IBOutlet var maxTemp: UILabel!
    @IBOutlet var minTemp: UILabel!
    
    let tempratureData = WeatherViewModel(apiServiceHandler: APIServiceHandler())
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     }
    
    
    func fillDayData(dayData: String, maxTemp: Int, minTemp: Int, weatherStatus: String) {
         self.day.text = dayData
         self.maxTemp.text = String(maxTemp) + "℃"
         self.minTemp.text = String(minTemp) + "℃"
        self.WeatherImage.image = UIImage(named: weatherStatus)
        
      }
    
}
