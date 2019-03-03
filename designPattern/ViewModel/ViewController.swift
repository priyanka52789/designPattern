//
//  ViewController.swift
//  designPattern
//
//  Created by Priyanka Sen on 03/03/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    var userList: [User] = []
    let cellIdentifier = "userCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.separatorStyle = .none
        loadUserData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadUserData() {
        for dic in ApiManager.fetchTestUserData() {
            let user = User(data: dic)
            userList.append(user)
        }
        print(userList.count)
        userTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let detailsVC = segue.destination as! DetailsViewController
            if let indexPath = userTableView.indexPathForSelectedRow {
                detailsVC.user = userList[indexPath.row]
                userTableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }

}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UserTableViewCell
        cell.userName.text = userList[indexPath.row].email ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
}

