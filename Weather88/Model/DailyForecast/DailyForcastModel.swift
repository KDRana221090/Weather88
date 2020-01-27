 
import Foundation
struct DailyForcastModel : Codable {
	let weatherData : [WeatherData]?
	let city_name : String?
	let lon : Int?
	let timezone : String?
	let lat : Int?
	let country_code : String?
	let state_code : String?

	enum CodingKeys: String, CodingKey {

		case weatherData = "data"
		case city_name = "city_name"
		case lon = "lon"
		case timezone = "timezone"
		case lat = "lat"
		case country_code = "country_code"
		case state_code = "state_code"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        weatherData = try values.decodeIfPresent([WeatherData].self, forKey: .weatherData)
		city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
		lon = try values.decodeIfPresent(Int.self, forKey: .lon)
		timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
		lat = try values.decodeIfPresent(Int.self, forKey: .lat)
		country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
		state_code = try values.decodeIfPresent(String.self, forKey: .state_code)
	}

}
