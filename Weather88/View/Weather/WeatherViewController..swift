//
//  Weather.swift
//  Weather88
//
//  Created by Apple on 25/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import UIKit
import GooglePlaces
class WeatherViewController: UIViewController {
    
    private let spacing:CGFloat = 6.0
    
    var footerView:HourlyForecastHeader?
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var tableView: UITableView!
    
    let weatherViewModel = WeatherViewModel(apiServiceHandler: APIServiceHandler())
    
    @IBOutlet var currentDay: UILabel!
    var placesClient: GMSPlacesClient!
    let locationManager = CLLocationManager()
    
    
    
    @IBOutlet var cityName: UILabel!
    
    @IBOutlet var weatherStatus: UILabel!
    
    @IBOutlet var temprature: UILabel!
    
    @IBOutlet var windSpeed: UILabel!
    
    @IBOutlet var minmaxTemp: UILabel!
    
    @IBOutlet var humidity: UILabel!
    
    @IBOutlet var noGPSView: UIView!
    
    @IBOutlet var icon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerColletionViewCell()
        self.getWeatherData()
     }
    
 
    
    func getWeatherData() {
        weatherViewModel.customDelegate = self
        currentDay.text = weatherViewModel.currentday
        
        
        if let lat = AppConfigManager.shared.getData(dataKey: AppConfigManagerConst.LATTITUDE.rawValue){
         
        noGPSView.isHidden = true
        
        let lat = AppConfigManager.shared.getData(dataKey: AppConfigManagerConst.LATTITUDE.rawValue)!
        let lon = AppConfigManager.shared.getData(dataKey: AppConfigManagerConst.LONGITUDE.rawValue)!
        
       let latVal = Double((lat as NSString).integerValue)
       let lonVal = Double((lon as NSString).integerValue)
        
        weatherViewModel.getDailyForeCastData(latVal, lonVal)
        weatherViewModel.getHourlyForeCastData(latVal, lonVal)
        weatherViewModel.getCurrentWeatherData(latVal, lonVal)
        } else {
            noGPSView.isHidden = false
            self.autocompleteClicked()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
         self.showLoader(message: "loading")
    }
    
    
    func registerColletionViewCell() {
         
        collectionView.register(UINib(nibName: "HourlyForcastCell", bundle: nil), forCellWithReuseIdentifier: "hourlyForcastCell")
        
        collectionView.register(UINib(nibName: "HourlyForecastHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "hourlyForecastHeader")
        
         tableView.register(UINib(nibName: "DailyForcastCell", bundle: nil), forCellReuseIdentifier: "dailyForcastCell")
        tableView.tableFooterView = UIView()
        
        let flag = DateUtils().CheckTime()
        if(flag == true) {
            self.icon.image = UIImage(named: "000")
         } else {
             self.icon.image = UIImage(named: "moon")
        }
      }
    
    
    
    
    
    
    
    
    func relaodCollectionData() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView!.isPagingEnabled = true
        collectionView!.isScrollEnabled = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        self.hideLoader()
        
    }
    
    
    @IBAction func changeCityActionButton(_ sender: Any) {
        self.autocompleteClicked()
    }
    
    
    func autocompleteClicked() {
         let autocompleteController = GMSAutocompleteViewController()
         autocompleteController.delegate = self
         let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.coordinate.rawValue) |
            UInt(GMSPlaceField.name.rawValue))!
        autocompleteController.placeFields = fields
        
        let filter = GMSAutocompleteFilter()
        autocompleteController.autocompleteFilter = filter
         present(autocompleteController, animated: true, completion: nil)
     }
    
    
    
    
 }





extension WeatherViewController: DailyForecastDelegate  {
    
    func updateCurrentWeatherData() {
     }
    
    func updateDailyForeCastData() {
         relaodCollectionData()
          let city = AppConfigManager.shared.getData(dataKey: AppConfigManagerConst.CURRENT_CITY.rawValue)
        if let current = city {
            self.cityName.text = current
        } else {
         self.cityName.text = weatherViewModel.cityName
        }
         self.weatherStatus.text = weatherViewModel.weatherCondition.capitalized
         self.temprature.text = weatherViewModel.temprature
         self.windSpeed.text = "Wind Speed\n" + weatherViewModel.WindSpeed
         self.humidity.text = "Humidity\n" + weatherViewModel.humidityVal
         self.minmaxTemp.text = "Max/Min \n" + weatherViewModel.maxTemp + "/" +  weatherViewModel.minTemp
        self.hideLoader()
       }
  }





extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 25
    }
    
     
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hourlyForcastCell", for: indexPath) as! HourlyForcastCell
         let next24Hours = DateUtils().getNext24Hours()
        if(weatherViewModel.averageTemprature.count>0) {
         cell.fillCell(next24Hours[indexPath.row], String(weatherViewModel.averageTemprature[indexPath.row]), String(weatherViewModel.weatherSatatus[indexPath.row]))
        }
         return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 1
        let spacingBetweenCells:CGFloat = 6
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }else{
            return CGSize(width: 0, height: 0)
        }
    
    }
    
     
    public func collectionView(_:UICollectionView, layout: UICollectionViewLayout, referenceSizeForHeaderInSection: Int) -> CGSize
    {
        if referenceSizeForHeaderInSection > 0 {
             return CGSize(width:0, height:50)
        }
        return CGSize(width:440, height:50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         switch kind {
            
            
        case UICollectionView.elementKindSectionHeader:
            
            let headerView =
                collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "hourlyForecastHeader", for: indexPath as IndexPath) as! HourlyForecastHeader
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    
    
    
    
}




extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyForcastCell", for: indexPath) as! DailyForcastCell
         let data = DateUtils().getNextSixDays()
        if(weatherViewModel.maxTemprature.count > 0) {
        cell.fillDayData(dayData: data[indexPath.row], maxTemp: weatherViewModel.maxTemprature[indexPath.row], minTemp: weatherViewModel.minTemprature[indexPath.row], weatherStatus: weatherViewModel.weatherIcons[indexPath.row])
        }
          return cell
         }
    
    
    
    
    
}





extension WeatherViewController: GMSAutocompleteViewControllerDelegate, CLLocationManagerDelegate, NVActivityIndicatorViewable {
    
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        if let place = place.name {
          AppConfigManager.shared.setData(data: place, dataKey: AppConfigManagerConst.CURRENT_CITY.rawValue)
        }
        
        
        
        
        
        AppConfigManager.shared.setData(data: String(place.coordinate.latitude), dataKey: AppConfigManagerConst.LATTITUDE.rawValue)
        AppConfigManager.shared.setData(data: String(place.coordinate.longitude), dataKey: AppConfigManagerConst.LONGITUDE.rawValue)
        
        
        weatherViewModel.getDailyForeCastData(Double(Int(place.coordinate.latitude)), Double(Int(place.coordinate.longitude)))
        weatherViewModel.getHourlyForeCastData(Double(Int(place.coordinate.latitude)), Double(Int(place.coordinate.longitude)))
        
        weatherViewModel.getCurrentWeatherData(Double(Int(place.coordinate.latitude)), Double(Int(place.coordinate.longitude)))
        
           noGPSView.isHidden = true
        
        
         dismiss(animated: true, completion: nil)
       }
    
    
    
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
          print("Error: ", error.localizedDescription)
    }
    
     func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    public func showLoader(message: String) {
        let size = CGSize(width: 50, height:50)
        startAnimating(size, message: message, type: NVActivityIndicatorType.ballSpinFadeLoader, color: UIColor.white, padding: 0.0, displayTimeThreshold: nil, minimumDisplayTime: nil)
    }
    
    public func hideLoader() {
        stopAnimating()
    }
   
}
