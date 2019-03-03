//
//  UserCellViewModel.swift
//  designPattern
//
//  Created by Priyanka Sen on 04/03/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import Foundation

class UserCellViewModel {

    var user: User?
    
    func configureCellData(_ indexPath: IndexPath, _ userDataSource: [User]) {
        user = userDataSource[indexPath.row]
    }
    
}
