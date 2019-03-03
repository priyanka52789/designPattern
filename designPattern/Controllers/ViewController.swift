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
    
    var userViewModel = UserViewModel()
    let cellIdentifier = "userCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        userViewModel.getUserData {
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let detailsVC = segue.destination as! DetailsViewController
            if let indexPath = userTableView.indexPathForSelectedRow {
                detailsVC.user = userViewModel.userDateSouce?[indexPath.row]
                userTableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }

}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.userDateSouce?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UserTableViewCell
        cell.cellViewModel.configureCellData(indexPath, userViewModel.userDateSouce ?? [])
        cell.reloadCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
}

