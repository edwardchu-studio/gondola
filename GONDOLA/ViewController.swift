//
//  ViewController.swift
//  GONDOLA
//
//  Created by 储仲尧 on 11/20/15.
//  Copyright © 2015 UTOPIA. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {
    
    @IBOutlet weak var helloButton: NSButton!
    
    @IBAction func showAlert(sender: AnyObject) {
       print("Hello world!")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

