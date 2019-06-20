//
//  UIViewController+XyralityExtensions.swift
//  Xyrality
//
//  Created by macBook pro on 6/20/19.
//  Copyright © 2019 AndriiHorban. All rights reserved.
//

import UIKit
//Extension to hide keyboard on tap
extension UIViewController {
    func hideKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
