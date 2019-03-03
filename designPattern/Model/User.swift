//
//  User.swift
//  designPattern
//
//  Created by Priyanka Sen on 03/03/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import Foundation

class User {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: [String:Any]?
    var phone: String?
    var website: String?
    var company: [String:String]?
    
    init() { // designated initialiser
    }
    
    convenience init(data: [String: Any]) {
        self.init()
        id = data["id"] as? Int
        name = data["name"] as? String
        username = data["username"] as? String
        email = data["email"] as? String
        address = data["address"] as? [String:Any]
        phone = data["phone"] as? String
        website = data["website"] as? String
        company = data["company"] as? [String:String]
        print(address!)
    }
    
    func getCompany() -> String {
        return "\(company!["name"] ?? ""), \(company!["catchPhrase"] ?? ""), \(company!["bs"] ?? "")"
    }
    
    func getAddress() -> String {
        return "Street: \(address!["street"] ?? ""), Suite: \(address!["suite"] ?? ""), City: \(address!["city"] ?? ""), Zipcode: \(address!["zipcode"] ?? "")"
    }
}


//{
//    "id": 1,
//    "name": "Leanne Graham",
//    "username": "Bret",
//    "email": "Sincere@april.biz",
//    "address": {
//        "street": "Kulas Light",
//        "suite": "Apt. 556",
//        "city": "Gwenborough",
//        "zipcode": "92998-3874",
//        "geo": {
//            "lat": "-37.3159",
//            "lng": "81.1496"
//        }
//    },
//    "phone": "1-770-736-8031 x56442",
//    "website": "hildegard.org",
//    "company": {
//        "name": "Romaguera-Crona",
//        "catchPhrase": "Multi-layered client-server neural-net",
//        "bs": "harness real-time e-markets"
//    }
//}

