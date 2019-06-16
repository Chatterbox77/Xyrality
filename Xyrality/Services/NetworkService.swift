//
//  NetworkService.swift
//  Xyrality
//
//  Created by macBook pro on 6/16/19.
//  Copyright © 2019 AndriiHorban. All rights reserved.
//

import Foundation
class NetworkService{
    static let shared = NetworkService()
    private init(){}
    func getDataFromServer(withEmail email:String,password:String,completion: @escaping (Result<[String:Any],DownloadError>) -> ()){
        let headers = [
            "cache-control": "no-cache"
//            ,
//            "Postman-Token": "1b9cf7c4-3e2e-428f-9ef5-dcd2ffa9a468"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds?login=\(email)&password=\(password)&deviceType=iPhone%20-%20iOS%2012.2&deviceId=7399DE16-EBF4-4184-8C10-BC62BC52429C")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                
                completion(.failure(.requestError))
            } else {
                guard let data = data else {
                    completion(.failure(.requestError))
                    return
                }
                guard let parsedData = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String:Any] else{
                    completion(.failure(.parseError))
                    return
                }
               
                completion(.success(parsedData))
                
            }
        })
        
        dataTask.resume()
    }
    
}
