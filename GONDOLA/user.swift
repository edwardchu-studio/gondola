//
//  user.swift
//  GONDOLA-Server
//
//  Created by 储仲尧 on 12/22/15.
//  Copyright © 2015 UTOPIA. All rights reserved.
//


class Guser{
    
    var userID : Int32
    var userName : String
    var gender : Int32
    
    init(ID:Int32 = -1, name: String, gender:Int32 = -1 ){
        self.userID=ID
        self.userName=name
        self.gender=gender
    }
    
}
