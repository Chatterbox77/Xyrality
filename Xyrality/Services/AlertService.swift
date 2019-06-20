//
//  AlertService.swift
//  Remind
//
//  Created by Kyle Lee on 9/10/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//
 
import UIKit
class AlertService {
    
    private init() {}
    // Presents alert
    static func alert(in vc: UIViewController, withTitle title: String, message:String,completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (_) in
            completion?()
        }
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
