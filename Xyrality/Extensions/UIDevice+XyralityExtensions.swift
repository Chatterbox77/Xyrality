//
//  UIDevice+XyralityExtensions.swift
//  Xyrality
//
//  Created by macBook pro on 6/16/19.
//  Copyright © 2019 AndriiHorban. All rights reserved.
//

import UIKit

extension UIDevice{
//  UIDevice property that returns the device type
    var deviceType:String{
        let deviceType = String(format: "%@ - %@%@", UIDevice.current.model,UIDevice.current.systemName,UIDevice.current.systemVersion)
        return deviceType
    }
    
}
 
