//
//  DetailsViewController.swift
//  designPattern
//
//  Created by Priyanka Sen on 03/03/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var user: User?
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var websiteLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    //@IBOutlet weak var addressMap: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userNameLbl.text = "User Name: \(user?.username ?? "test username")"
        nameLbl.text = "Name: \(user?.name ?? "test name")"
        emailLbl.text = "Email: \(user?.email ?? "test email")"
        phoneLbl.text = "Phone: \(user?.phone ?? "test phone")"
        companyLbl.text = "Company: \(user?.getCompany() ?? "test company")"
        websiteLbl.text = "Website: \(user?.website ?? "test website")"
        addressLbl.text = "Address: \(user?.getAddress() ?? "test address")"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
