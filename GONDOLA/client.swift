//
//  server.swift
//  GONDOLA
//
//  Created by 储仲尧 on 12/19/15.
//  Copyright © 2015 UTOPIA. All rights reserved.
//

import Foundation

class Gclient{
    var addr:String
    var port:Int
    var user:Guser
    let client:TCPClient
    var GmsgOutQueue=[JSON]()
    var GmsgInQueue=[JSON]()
    
    init(addr:String="127.0.0.1", port:Int=80, user:Guser){
        self.addr=addr
        self.port=port
        self.user=user
        self.client=TCPClient(addr: self.addr, port: self.port)
//        var (success,errmsg)=self.client.connect(timeout:1000)
//        if(success){
//            print("Connetion Established!")
//
//        }
        //self.acceptMsg()
        return
    }
    
    func login(){
        self.client.connect(timeout:1000)
        let loginMsg=JSON(["type":"sys","fromID":self.user.userID.description,"info":"login","content":"null"])
        let (success,errmsg)=self.client.send(str: String(loginMsg))
        if success{
            print(errmsg)
            //read massege
            let data=client.read(1024*10,timeout:5)
            print(data)
            if let d=data{
                if let str=String(bytes: d, encoding: String.Encoding.utf8){
                    print(str) //the login operation feedback from the server
                }
                //acceptMsg()
            }
        }else{
            print(errmsg)
        }
    }

    func sendMsg(_ toID:Int32,content:String)->(Bool,String){
        self.client.connect(timeout:1000)
        let msgGen=["timestamp": String(getTime()),"fromID":user.userID.description,"toID":toID.description,"content":content]
//        msg!["timestamp"].string=getTime()
//        msg!["ip"].string=self.client.addr
//        msg!["port"].string=self.client.port.description
//        msg!["fromID"].string=self.user.userID.description
//        msg!["toID"].string=toID.description
//        msg!["content"].string=content
        var msg=JSON(msgGen)
        
        var pkg=["type":"usr","info":"send","msg":msg]
        var Msg=JSON(pkg)
        var (success,errmsg)=self.client.send(str: String(Msg))
        if success{
            var data=client.read(1024*10,timeout: 5)
            if let d=data{
                if let str=String(bytes: d, encoding: String.Encoding.utf8){
                    print(str)
                }
            }
        }else{
            print(errmsg)
        }
        return (success,errmsg)
    }
    
    func logout(){
        self.client.connect(timeout:1000)
        let logoutMsg=JSON(["type":"sys","fromID":self.user.userID.description,"info":"logout","content":"null"])
        let (success,errmsg)=self.client.send(str: String(logoutMsg))
        if success{
            //read massege
            let data=client.read(1024*10)
            if let d=data{
                if let str=String(bytes: d, encoding: String.Encoding.utf8){
                    print(str) //the login operation feedback from the server
                }
            }
        }else{
            print(errmsg)
        }
    }
    
    func acceptMsg(){
        self.client.connect(timeout:1000)
        while true{
            let data=client.read(1024*10)
            if let d=data{
                if let str=String(bytes: d, encoding: String.Encoding.utf8){
                    print(str) //the login operation feedback from the server
                }
            }
        }
        return
    }
    
    func fetchMsg()->(Bool,String){
        self.client.connect(timeout:1000)
        let loginMsg=JSON(["type":"pull","fromID":self.user.userID.description,"info":"pull","content":"null"])
        let (success,errmsg)=self.client.send(str: String(loginMsg))
//        if success{
//            print(errmsg)
//            //read massege
//            let data=client.read(1024*10,timeout:5)
//            print(data)
//            if let d=data{
//                if let str=String(bytes: d, encoding: NSUTF8StringEncoding){
//                    print(str) //the newest msg pulled from the serever
//                }
//                //acceptMsg()
//            }
//        }else{
//            print(errmsg)
//        }
        return (success,errmsg)
    }
    
    func getTime()->String{
        return Date().timeIntervalSince1970.description
    }
    
    func close(){
        self.client.close()
    }
    
}


