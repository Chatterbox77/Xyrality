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
    static func alert(in vc: UIViewController,attachTo view:UIView, withTitle title: String, message:String,completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Ok", style: .default) { (_) in
            completion?()
        }
        alert.addAction(action)
        if UIDevice.current.userInterfaceIdiom == .pad{
            if let presenter = alert.popoverPresentationController {
                presenter.sourceView = view
                presenter.sourceRect = view.bounds
            }
        }
        vc.present(alert, animated: true)
    }
}
