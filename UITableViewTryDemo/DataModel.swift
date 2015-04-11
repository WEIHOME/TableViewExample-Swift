//
//  DataModel.swift
//  UITableViewTryDemo
//
//  Created by Weihong Chen on 01/02/2015.
//  Copyright (c) 2015 Weihong. All rights reserved.
//

import Foundation
class DataModel {
    var name: String?
    var age: Int?
    var imageName: String?
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func getName()->String{
        return self.name!
    }
    
    func getAge()->Int{
        return self.age!
    }

    
    func setName(name: String){
        self.name = name
    }
    
    func setAge(age:Int){
        self.age = age
    }

}