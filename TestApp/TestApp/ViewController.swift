//
//  ViewController.swift
//  TestApp
//
//  Created by עלי חלאחלה on 19/10/2023.
//

import UIKit

let screenSize: CGRect = UIScreen.main.bounds

class ViewController: UIViewController {

    
    @IBOutlet var viewTest: ViewTest!
    
    static let itemClicked = Notification.Name("ItemClicked")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: ViewController.itemClicked, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
          NotificationCenter.default.addObserver(self, selector: #selector(clickItemNotification(notification:)), name: ViewController.itemClicked, object: nil)
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    @objc func clickItemNotification(notification:Notification){
        print("Show table")
        
        let data = String(describing:(notification.userInfo?["data"])!)
        print("data ", data)
        
        viewTest.isHidden = true
    }
}

