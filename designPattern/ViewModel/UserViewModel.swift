//
//  UserViewModel.swift
//  designPattern
//
//  Created by Priyanka Sen on 03/03/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import Foundation

class UserViewModel {
    var userDateSouce: [User]?
    
    func getUserData(_ complition: @escaping () -> ()) {
        ApiManager.shared.getUserData { (users) in
            self.userDateSouce = users
            complition()
        }
    }
}
