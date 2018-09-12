//
//  DarkSkyService.swift
//  DarkSkyWeather
//
//  Created by Mai Pham Quang Huy on 9/12/18.
//  Copyright © 2018 Mai Pham Quang Huy. All rights reserved.
//

import Foundation
import Alamofire

public class DarkSkyService {
    private static let baseURL = "https://api.darksky.net/forecast/"
    private static let apiKey = "9b43add4303def8ddb395cc7fec44be7"
    
    static func weatherForCoordinates(latitude: String, longitude: String, completion: @escaping (WeatherData?, Error?) -> ()) {
        
        let url = baseURL + apiKey + "/\(latitude),\(longitude)"
        
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let result):
                completion(WeatherData(data: result), nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
        
    }
}
