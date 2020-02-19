 import Foundation






public class APIServiceHandler: NSObject {
    
    func makeSecureRestGetAPIRequest(requestData: [String: Any], withURL url:String, completion:  @escaping (NetworkResult)  ->())  {
        
        print(url)
        print(requestData)
        let url = NSURL(string: url)
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestData, options: .prettyPrinted)
            
         } catch let error {
            print(error.localizedDescription)
        }
        print(request)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard let data = data else {
                completion(NetworkResult.failure(NetworkError.fetchError))
                 return
            }
            do {
                
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject] {
                    print("JSON Data is: \(json)" )
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


