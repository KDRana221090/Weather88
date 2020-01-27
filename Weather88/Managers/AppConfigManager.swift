//
//  AppConfigManager.swift
//  Weather88
//
//  Created by Apple on 27/01/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import Foundation
import SystemConfiguration


class AppConfigManager: NSObject {
    static let shared = AppConfigManager()
    private override init(){}
    
    
    
    func setData(data: String, dataKey: String) {
       UserDefaults.standard.set(data, forKey: dataKey)
     //  print(saveSuccessful)
       }
    
    
     func getData(dataKey: String) -> String?{
        if let data = UserDefaults.standard.string(forKey: dataKey) {
            return data
         }
        return nil
       }

    
    
    func setNumData(data: Int, dataKey: String) {
        UserDefaults.standard.set(data, forKey: dataKey)
      //  print(saveSuccessful)
    }
    
    
    func getNumData(dataKey: String) -> Int?{
        if let data = UserDefaults.standard.string(forKey: dataKey) {
            return Int(data)
        }
        return nil
    }

    
    
    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
        
    }



  }
