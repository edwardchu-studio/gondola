//
//  AppDelegate.swift
//  GONDOLA
//
//  Created by 储仲尧 on 11/20/15.
//  Copyright © 2015 UTOPIA. All rights reserved.
//

import Cocoa
import Foundation
import Darwin.C


//Users:Lilei, Hanmeimei, Edward

//Server and clients


let testClient=Gclient(addr:"127.0.0.1",port:8080,user:Edward)

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        //print("Testing the login SDK")
        //testClient.login()
        //testClient.acceptMsg()
        //NSThread.sleepForTimeInterval(2)
        //print("Now test the message!")
        //testClient.sendMsg(3, content: "Save me a piece of dance, my lady~")
        

    }



    func applicationWillTerminate(_ aNotification: Notification) {

    }


}
