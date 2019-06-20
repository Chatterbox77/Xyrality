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
    @IBOutlet weak var loginBtn:RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
        usernameField.delegate = self
        passwordField.delegate = self

        
    }
    func parseData(data:Data) -> [Server]?{
        var propertyListForamt =  PropertyListSerialization.PropertyListFormat.binary
        if let dict = try? PropertyListSerialization.propertyList(from: data, options:.mutableContainersAndLeaves,format: &propertyListForamt) as? [String:Any] {
            var servers:[Server] = []

            if let availableWorldsArray = dict["allAvailableWorlds"] as? [[String:Any]]{
                for element in availableWorldsArray{

                    if let server = Server(fromDictionary: element){
                        servers.append(server)
                    }
                    
                }
            return servers
            }
            
        }
        
        return nil
    }

    
    
    func showAlert(withitle title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginBtnTaped(_ sender:UIButton){
        if Reachability.isConnectedToNetwork(){
            loginBtn.startAnimation() // 2: Then start the animation when the user tap the button
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                
                NetworkService.shared.getDataFromServer(withEmail: "ios.test@xyrality.com", password: "password"){
                    result in
                    
                    switch result{
                        case .success(let data):
                            if let servers = self.parseData(data: data){
                                DispatchQueue.main.async(execute: { () -> Void in
                                    
                                    self.loginBtn.stopAnimation(animationStyle: .expand) {
                                        
                                        if let destinationVC = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "listVC") as? ListVC {
                                            destinationVC.servers = servers
                                            self.present(destinationVC, animated: true, completion: nil)
                                        }
                                    }
                                })
                            }else{

                                DispatchQueue.main.async(execute: { () -> Void in
                                    
                                    self.loginBtn.stopAnimation(animationStyle: .shake) {
                                        self.showAlert(withitle: "Something went wrong!", message: "Please check your login credentials and try again")
                                    }
                                })
                            }
                            break
                        case .failure(let error):
                            print(error.localizedDescription)
                            DispatchQueue.main.async(execute: { () -> Void in
                                
                                self.loginBtn.stopAnimation(animationStyle: .shake) {
                                   self.showAlert(withitle: "Something went wrong!", message: "please try again")
                                }
                            })
                            break
                        }
                
                
            }
            })
        }
    }
    

}

extension LoginVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
}
