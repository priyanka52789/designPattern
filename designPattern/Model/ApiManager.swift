//
//  ApiManager.swift
//  designPattern
//
//  Created by Priyanka Sen on 03/03/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import UIKit

class ApiManager: NSObject {

    static func fetchUserData() -> [[String:Any]] {
        var resultentArray: [[String:Any]] = []
        
        let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        let request : NSMutableURLRequest = NSMutableURLRequest()
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return [["error" : "url error"]]}
        request.url = url
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let userData = data, error == nil else  {
                print(error?.localizedDescription ?? "Response error")
                resultentArray = [["error" : error?.localizedDescription ?? "Response error"]]
                return
            }
            do {
                if let userArray = try JSONSerialization.jsonObject(with: userData, options: []) as? [[String: Any]]{
                    resultentArray = userArray
                } else {
                    resultentArray = [["error" : "error.description"]]
                }
            } catch let error as NSError {
                print(error)
                resultentArray = [["error": error.description]]
            }
        }
        task.resume()
        return resultentArray
    }
    
    static func fetchTestUserData() -> [[String:Any]] {
        let userJson : String = "[{\"id\": 1,\"name\": \"Leanne Graham\",\"username\": \"Bret\",\"email\": \"Sincere@april.biz\",\"address\": {    \"street\": \"Kulas Light\",    \"suite\": \"Apt. 556\",    \"city\": \"Gwenborough\",    \"zipcode\": \"92998-3874\",    \"geo\": {        \"lat\": \"-37.3159\",        \"lng\": \"81.1496\"    }},\"phone\": \"1-770-736-8031 x56442\",\"website\": \"hildegard.org\",\"company\": {    \"name\": \"Romaguera-Crona\",    \"catchPhrase\": \"Multi-layered client-server neural-net\",    \"bs\": \"harness real-time e-markets\"}},{\"id\": 2,\"name\": \"Ervin Howell\",\"username\": \"Antonette\",\"email\": \"Shanna@melissa.tv\",\"address\": {    \"street\": \"Victor Plains\",    \"suite\": \"Suite 879\",    \"city\": \"Wisokyburgh\",    \"zipcode\": \"90566-7771\",    \"geo\": {        \"lat\": \"-43.9509\",        \"lng\": \"-34.4618\"    }},\"phone\": \"010-692-6593 x09125\",\"website\": \"anastasia.net\",\"company\": {    \"name\": \"Deckow-Crist\",    \"catchPhrase\": \"Proactive didactic contingency\",    \"bs\": \"synergize scalable supply-chains\"}},{\"id\": 3,\"name\": \"Clementine Bauch\",\"username\": \"Samantha\",\"email\": \"Nathan@yesenia.net\",\"address\": {    \"street\": \"Douglas Extension\",    \"suite\": \"Suite 847\",    \"city\": \"McKenziehaven\",    \"zipcode\": \"59590-4157\",    \"geo\": {        \"lat\": \"-68.6102\",        \"lng\": \"-47.0653\"    }},\"phone\": \"1-463-123-4447\",\"website\": \"ramiro.info\",\"company\": {    \"name\": \"Romaguera-Jacobson\",    \"catchPhrase\": \"Face to face bifurcated interface\",    \"bs\": \"e-enable strategic applications\"}}]"
        let userData = userJson.data(using: .utf8)
        do {
            if let userArray = try JSONSerialization.jsonObject(with: userData!, options: .allowFragments) as? [[String: Any]]{
                return userArray
            } else {
                return [["error" : "error.description"]]
            }
        } catch let error as NSError {
            print(error)
            return [["error": error.description]]
        }
    }
}

