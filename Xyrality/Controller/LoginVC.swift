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
        NetworkService.shared.getDataFromServer(withEmail: "ios.test@xyrality.com", password: "password"){
            result in
            switch result{
            case .success(let data):
                print(data)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
        
        
        
    }
func postAction() {
    
    let headers = [
        "cache-control": "no-cache",
        "Postman-Token": "1b9cf7c4-3e2e-428f-9ef5-dcd2ffa9a468"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds?login=ios.test@xyrality.com&password=password&deviceType=iPhone%20-%20iOS%2012.2&deviceId=7399DE16-EBF4-4184-8C10-BC62BC52429C")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }
    })
    
    dataTask.resume()
}
    @IBAction func loginBtnTaped(_ sender:UIButton){
        guard let username = usernameField.text, let password = passwordField.text else { return }
    }


}

