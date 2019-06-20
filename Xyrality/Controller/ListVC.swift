//
//  ListVC.swift
//  Xyrality
//
//  Created by macBook pro on 6/16/19.
//  Copyright © 2019 AndriiHorban. All rights reserved.
//

import UIKit

class ListVC: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    
    var servers:[Server]!
    private var serversSortedByName:[Server]!
    private var serversSortedByCountry:[Server]!
    private var serversSortedByLanguage:[Server]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortServers()
        servers = serversSortedByName

        tableView.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tableView.delegate = self
        tableView.dataSource = self


    }
    @IBAction func segmentedControlValueChanged(_ sender:UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            servers = serversSortedByName
        case 1:
            servers = serversSortedByCountry
        default:
            servers = serversSortedByLanguage
        }
        tableView.reloadData()
    }
    private func sortServers(){
        
        serversSortedByName = servers.sorted{$0.serverName < $1.serverName}
        serversSortedByCountry = servers.sorted{$0.country < $1.country}
        serversSortedByLanguage = servers.sorted{$0.language < $1.language}
    }
    @IBAction func logOutBtnPressed(_ sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
}
extension ListVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    } 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SERVER_DATA_CELL) as? ServerDataCell else { return UITableViewCell() }
        cell.configureCell(server:servers[indexPath.row])
        return cell
    }
    
    
}
