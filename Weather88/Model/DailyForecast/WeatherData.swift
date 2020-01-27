/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct WeatherData : Codable {
	let moonrise_ts : Int?
	let wind_cdir : String?
	let rh : Int?
	let pres : Double?
	let high_temp : Double?
	let sunset_ts : Int?
	let ozone : Double?
	let moon_phase : Double?
	let wind_gust_spd : Double?
	let snow_depth : Double?
	let clouds : Int?
	let ts : Int?
	let sunrise_ts : Int?
	let app_min_temp : Double?
	let wind_spd : Double?
	let pop : Int?
	let wind_cdir_full : String?
	let slp : Double?
	let valid_date : String?
	let app_max_temp : Double?
	let vis : Double?
	let dewpt : Double?
	let snow : Int?
	let uv : Double?
	let weather : Weather?
	let wind_dir : Int?
	let max_dhi : String?
	let clouds_hi : Int?
	let precip : Double?
	let low_temp : Double?
	let max_temp : Double?
	let moonset_ts : Int?
	let datetime : String?
	let temp : Double?
	let min_temp : Double?
	let clouds_mid : Int?
	let clouds_low : Int?

	enum CodingKeys: String, CodingKey {

		case moonrise_ts = "moonrise_ts"
		case wind_cdir = "wind_cdir"
		case rh = "rh"
		case pres = "pres"
		case high_temp = "high_temp"
		case sunset_ts = "sunset_ts"
		case ozone = "ozone"
		case moon_phase = "moon_phase"
		case wind_gust_spd = "wind_gust_spd"
		case snow_depth = "snow_depth"
		case clouds = "clouds"
		case ts = "ts"
		case sunrise_ts = "sunrise_ts"
		case app_min_temp = "app_min_temp"
		case wind_spd = "wind_spd"
		case pop = "pop"
		case wind_cdir_full = "wind_cdir_full"
		case slp = "slp"
		case valid_date = "valid_date"
		case app_max_temp = "app_max_temp"
		case vis = "vis"
		case dewpt = "dewpt"
		case snow = "snow"
		case uv = "uv"
		case weather = "weather"
		case wind_dir = "wind_dir"
		case max_dhi = "max_dhi"
		case clouds_hi = "clouds_hi"
		case precip = "precip"
		case low_temp = "low_temp"
		case max_temp = "max_temp"
		case moonset_ts = "moonset_ts"
		case datetime = "datetime"
		case temp = "temp"
		case min_temp = "min_temp"
		case clouds_mid = "clouds_mid"
		case clouds_low = "clouds_low"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		moonrise_ts = try values.decodeIfPresent(Int.self, forKey: .moonrise_ts)
		wind_cdir = try values.decodeIfPresent(String.self, forKey: .wind_cdir)
		rh = try values.decodeIfPresent(Int.self, forKey: .rh)
		pres = try values.decodeIfPresent(Double.self, forKey: .pres)
		high_temp = try values.decodeIfPresent(Double.self, forKey: .high_temp)
		sunset_ts = try values.decodeIfPresent(Int.self, forKey: .sunset_ts)
		ozone = try values.decodeIfPresent(Double.self, forKey: .ozone)
		moon_phase = try values.decodeIfPresent(Double.self, forKey: .moon_phase)
		wind_gust_spd = try values.decodeIfPresent(Double.self, forKey: .wind_gust_spd)
		snow_depth = try values.decodeIfPresent(Double.self, forKey: .snow_depth)
		clouds = try values.decodeIfPresent(Int.self, forKey: .clouds)
		ts = try values.decodeIfPresent(Int.self, forKey: .ts)
		sunrise_ts = try values.decodeIfPresent(Int.self, forKey: .sunrise_ts)
		app_min_temp = try values.decodeIfPresent(Double.self, forKey: .app_min_temp)
		wind_spd = try values.decodeIfPresent(Double.self, forKey: .wind_spd)
		pop = try values.decodeIfPresent(Int.self, forKey: .pop)
		wind_cdir_full = try values.decodeIfPresent(String.self, forKey: .wind_cdir_full)
		slp = try values.decodeIfPresent(Double.self, forKey: .slp)
		valid_date = try values.decodeIfPresent(String.self, forKey: .valid_date)
		app_max_temp = try values.decodeIfPresent(Double.self, forKey: .app_max_temp)
		vis = try values.decodeIfPresent(Double.self, forKey: .vis)
		dewpt = try values.decodeIfPresent(Double.self, forKey: .dewpt)
		snow = try values.decodeIfPresent(Int.self, forKey: .snow)
		uv = try values.decodeIfPresent(Double.self, forKey: .uv)
		weather = try values.decodeIfPresent(Weather.self, forKey: .weather)
		wind_dir = try values.decodeIfPresent(Int.self, forKey: .wind_dir)
		max_dhi = try values.decodeIfPresent(String.self, forKey: .max_dhi)
		clouds_hi = try values.decodeIfPresent(Int.self, forKey: .clouds_hi)
		precip = try values.decodeIfPresent(Double.self, forKey: .precip)
		low_temp = try values.decodeIfPresent(Double.self, forKey: .low_temp)
		max_temp = try values.decodeIfPresent(Double.self, forKey: .max_temp)
		moonset_ts = try values.decodeIfPresent(Int.self, forKey: .moonset_ts)
		datetime = try values.decodeIfPresent(String.self, forKey: .datetime)
		temp = try values.decodeIfPresent(Double.self, forKey: .temp)
		min_temp = try values.decodeIfPresent(Double.self, forKey: .min_temp)
		clouds_mid = try values.decodeIfPresent(Int.self, forKey: .clouds_mid)
		clouds_low = try values.decodeIfPresent(Int.self, forKey: .clouds_low)
	}

}


