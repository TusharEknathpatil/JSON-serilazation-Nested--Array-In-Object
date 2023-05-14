//
//  ViewController.swift
//  ApiTesting-Part - 3
//
//  Created by Mac on 14/05/23.
//

import UIKit

class ViewController: UIViewController {

    var users:[User] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }

    
    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("Error")
            return  }
        URLSession.shared.dataTask(with: url) {
            Data,response,error in
            
            guard let data = Data else {
                print("data not Come ")
                return
            }
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data) as! [[String:Any]]
                
                for jsonArray in jsonObject {
                    
                    let eachUser = jsonArray as! [String:Any]
                    
                    let eachId = eachUser["id"] as! Int
                    let eachName = eachUser["name"] as! String
                    let eachUserName = eachUser["username"] as! String
                    let eachEmail = eachUser["email"] as! String
                    let eachAddress = eachUser["address"] as! [String:Any]
                    let eachStreet = eachAddress["street"] as! String
                    let eachSuite = eachAddress["suite"] as! String
                    let eachCity = eachAddress["city"] as! String
                    let eachZipcode = eachAddress["zipcode"] as! String
                    let eachGeo = eachAddress["geo"] as! [String:Any]
                    
                    let eachlat = eachGeo["lat"] as! String
                    let eachlng = eachGeo["lng"] as! String
                    
                    let eachPhone = eachUser["phone"] as! String
                    let eachWebsite = eachUser["website"] as! String
                    let eachCompany = eachUser["company"] as! [String:Any]
                    
                    let eachNameSecond = eachCompany["name"] as! String
                    let eachCatchPhrase = eachCompany["catchPhrase"] as! String
                    
                    var geoAppend = Geo(lat: eachlat, lng: eachlng)
                    
                    var addressAppend = Address(street: eachStreet, suite: eachSuite, city: eachCity, zipcode: eachZipcode, geo: geoAppend)
                    
                    var companyAppend = Company(name: eachNameSecond, catchPhrase: eachCatchPhrase)
                     var userAppend = User(id: eachId, name: eachName, username: eachUserName, email: eachEmail, address: addressAppend, phone: eachPhone, website: eachWebsite, company: companyAppend)
                    self.users.append(userAppend)
                                        
                }
                
                
                print(self.users.self)
                print(self.users.count)
            
                
                
            }
            catch {
                print("Error ")
            }
        }.resume()
        
        
        
        
    }

}

