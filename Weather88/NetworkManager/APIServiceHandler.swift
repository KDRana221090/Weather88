//
//  APIServiceHandler.swift
//  Weather88
//
//  Created by Apple on 25/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation



enum NetworkError {
    case networkError
    case fetchError
    
    var errorMessage: String {
        switch self {
        case .networkError: return "Something went wrong!"
        case .fetchError: return "Unable to Fetch!"
        }
    }
}

 enum NetworkResult {
    case success(Data)
    case failure(NetworkError)
}



 public class APIServiceHandler: NSObject {
   func makeSecureRestGetAPIRequest(withURL url:String, completion: @escaping (NetworkResult)  ->())  {
    
        let url = NSURL(string: url)
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard let data = data else {
                 completion(NetworkResult.failure(NetworkError.fetchError))
                 return
                }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject] {
                     DispatchQueue.main.async {
                        completion(NetworkResult.success(data))
                     }
                  }
               } catch let error {
                 completion(NetworkResult.failure(NetworkError.networkError))
                 print(error.localizedDescription)
             }
          })
        task.resume()
      }
  }



