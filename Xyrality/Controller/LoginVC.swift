//
//  ViewController.swift
//  Xyrality
//
//  Created by macBook pro on 6/16/19.
//  Copyright © 2019 AndriiHorban. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var usernameField:UITextField!
    @IBOutlet weak var passwordField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        
    }
    
    @IBAction func loginBtnTaped(_ sender:UIButton){
        guard let username = usernameField.text, let password = passwordField.text else { return }
    }


}

