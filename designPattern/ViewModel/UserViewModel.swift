//
//  UserViewModel.swift
//  designPattern
//
//  Created by Priyanka Sen on 03/03/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import Foundation

class UserViewModel {
    var userDateSource: [User]?
    
    func getUserData(_ complition: @escaping () -> ()) {
        ApiManager.shared.getUserData { (users) in
            self.userDateSource = users
            complition()
        }
    }
}
