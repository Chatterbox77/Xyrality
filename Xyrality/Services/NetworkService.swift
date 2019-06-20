//
//  NetworkService.swift
//  Xyrality
//
//  Created by macBook pro on 6/16/19.
//  Copyright © 2019 AndriiHorban. All rights reserved.
//

import UIKit
class NetworkService{
    static let shared = NetworkService()
    private init(){} 
    
    //Downloads data from the server. Returns Result.success(Data) in case of success, return Result.failure(Error) in case of error
    func  getDataFromServer(withEmail email:String,password:String, completion: @escaping (Result<Data,Error>) -> ()) {
        let urlString = "http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds"
        var request = URLRequest(url: URL(string:urlString)!)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = (requestParameters(fromEmail: email, password: password) ?? "").data(using: String.Encoding.utf8)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request){ (data, response, error) -> () in
            if let error = error{
                    completion(.failure(error))
                }else{
                    completion(.success(data!))
            }
            
        }
        dataTask.resume()
    }
    
    // generates httpBody from provided parameters. returns Optional(String)
    private func requestParameters(fromEmail email: String, password: String) -> String? {
        
        let params: Dictionary<String, String> = [
            "login": email,
            "password": password,
            "deviceType": UIDevice.current.deviceType,
            "deviceId": UUID().uuidString
        ]
        let paramsString: String = Array(params.map { "\($0)=\($1)"}).joined(separator: "&")
        
        guard let encodedString = paramsString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return nil }
        return encodedString
        
        
    }
}

