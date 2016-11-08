//
//  ViewController.swift
//  GONDOLA
//
//  Created by 储仲尧 on 11/20/15.
//  Copyright © 2015 UTOPIA. All rights reserved.
//

import Cocoa
import AppKitScripting

var Client:Gclient!

let lileiLogo=NSImage.init(byReferencingFile: "Resources/Img/lilei.png")
let hanmeimeiLogo=NSImage.init(byReferencingFile: "Resources/Img/hanmeimei.png")

let Lilei=Guser(ID:1,name:"Lilei",gender:1)
let Hanmeimei=Guser(ID:1,name:"Hanmeimei",gender:1)
let Edward=Guser(ID: 3, name:"Edward",gender:1)


class LoginViewController: NSViewController {
    

    var mainQueue=OperationQueue.main
    

    @IBOutlet weak var lileiButton: NSButton!

    
    @IBOutlet weak var hanmeimeiButton: NSButton!
    
    
    @IBAction func loginAsLilei(_ sender: AnyObject) {
//        hanmeimeiButton.setValue(<#T##value: AnyObject?##AnyObject?#>, forKey: <#T##String#>)
        print("Lilei logged in!")
        
        
        Client=Gclient(addr:"127.0.0.1",port:8080,user:Lilei)
        self.performSegue(withIdentifier: "toChitchat", sender: lileiButton)
    }
    

    @IBAction func loginAsHanmeimei(_ sender: AnyObject) {
        print("Hanmeimei logged in!")
        Client=Gclient(addr:"127.0.0.1",port:8080,user:Hanmeimei)
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




class chitChatViewController: NSViewController{
    
    var mainQueue=OperationQueue.main
    var backgroundQueue=OperationQueue()
    
    @IBOutlet weak var usrName: NSTextField!
    
    @IBOutlet weak var messageField: NSTextField!

    @IBOutlet weak var usrLogo:NSImageView!
    
    @IBOutlet var chatBoardText: NSTextView!
    
    @IBOutlet weak var friendList: NSTableColumn!
    
    @IBOutlet weak var friendListCell: NSTextField!
    
    @IBOutlet weak var friendLIstTextFieldCell: NSTextFieldCell!
    override func viewWillAppear() {
        
        print("test")
        var HClient=Gclient(addr:"127.0.0.1",port:8080,user:Hanmeimei)
        Client=Gclient(addr:"127.0.0.1",port:8080,user:Lilei)
        print(Client.user.userName)
        
        HClient.sendMsg(1, content: "我很好")
        HClient.sendMsg(1, content: "他也很好")
        HClient.sendMsg(1, content: "你还好吗？")
        HClient.sendMsg(1, content: "她还好吗")
        
    
        Client.login()
    
        
        
    }
   
    
    @IBAction func Logout(_ sender: AnyObject) {
        
        Client.logout()
        Client.client.close()
        view.window!.close()
        
    }
    
    @IBAction func sendMessage(_ sender: AnyObject) {
        
        //chatBoardText.insertText(String("Lilei:  她刚刚说，她很好\n"))
        let msgContent=messageField.stringValue
                chatBoardText.insertText("\(Client.user.userName):  \(String(msgContent))\n")

        messageField.stringValue=""
        Client.sendMsg(2, content: msgContent)
        print(msgContent)
        
    }
    override func viewDidLoad() {
  
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
            
        }
    }
    
    
 
    func refreshChatBoard(){
        while(true){
            var (success,errmsg)=Client.fetchMsg()
            if success{
                print(errmsg)
                    //read massege
                    let data=Client.client.read(1024*10,timeout:5)
                    print(data)
                    if let d=data{
                        if let str=String(bytes: d, encoding: String.Encoding.utf8){
                                     print(str) //the newest msg pulled from the serever
                                }
                                //acceptMsg()
                            }
            }
        }
    }
    
}




func sceneTransition(){
//    if(LoginViewController.will)
    
}
