//
//  AppDelegate.swift
//  GONDOLA
//
//  Created by 储仲尧 on 11/20/15.
//  Copyright © 2015 UTOPIA. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        let _myURL=NSURL(string:"http://ivory.edwardchor.com/GONDOLA/fetchInfo.php")
        let _host=_myURL?.host
        print(_host)
        let session=NSURLSession(
            configuration: NSURLSessionConfiguration
                            .defaultSessionConfiguration())

    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}
