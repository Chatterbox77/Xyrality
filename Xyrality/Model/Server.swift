//
//  Server.swift
//  Xyrality
//
//  Created by macBook pro on 6/16/19.
//  Copyright © 2019 AndriiHorban. All rights reserved.
//

import Foundation
//struct that stores server data
struct Server{
    private(set) var serverName:String
    private(set) var country:String
    private(set) var language:String
    private(set) var mapUrl:String
    private(set) var url:String
    private(set) var worldStatus:String
    private(set) var worldStatusId:String
    init?(fromDictionary dict:[String:Any]){
        
        guard let serverName = dict["name"] as? String ,
            let country = dict["country"] as? String ,
            let language = dict["language"] as? String ,
            let mapUrl = dict["mapURL"] as? String ,
            let url = dict["url"] as? String ,
            let worldStatusDict = dict["worldStatus"] as? [String:Any] ,
            let worldStatus = worldStatusDict["description"] as? String ,
            let worldStatusId = worldStatusDict["id"] as? String else { return nil }
        self.serverName = serverName
        self.country = country 
        self.language = language
        self.mapUrl = mapUrl
        self.url = url
        self.worldStatus = worldStatus
        self.worldStatusId = worldStatusId
    }
    
}
