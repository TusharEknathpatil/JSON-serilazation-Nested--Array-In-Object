//
//  User.swift
//  ApiTesting-Part - 3
//
//  Created by Mac on 14/05/23.
//

import Foundation
struct User {
    var id:Int
    var name:String
    var username:String
    var email:String
    var address:Address
    var phone:String
    var website:String
    var company:Company
}

struct Address{
    var street:String
    var suite:String
    var city:String
    var zipcode:String
    var geo:Geo
}

struct Company {
    var name:String
    var catchPhrase:String
}

struct Geo {
    var lat:String
    var lng:String
}
