//
//  ViewTest.swift
//  TestApp
//
//  Created by עלי חלאחלה on 19/10/2023.
//

import Foundation
import UIKit

class ViewTest: UIView {
    
    @IBOutlet var showTable: UIButton!
    @IBOutlet var title: UILabel!
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        
        loadViewFromNib ()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    private func loadViewFromNib(){
        
        Bundle.main.loadNibNamed("ViewTest", owner: self, options: nil)
        
        addSubview(title)
        addSubview(showTable)
        
        title.textColor = UIColor.mainBlue
        
        title.frame = CGRect(x: (screenSize.width - self.title.frame.size.width)/2, y: self.title.frame.origin.y, width:self.title.frame.size.width, height: self.title.frame.size.height)
        title.text = "test app"
        
        showTable.addTarget(self, action: #selector(showTableBtn), for: .touchUpInside)
    }
    
    @objc func showTableBtn() {
        NotificationCenter.default.post(name: ViewController.itemClicked, object: nil, userInfo:["data": "linkCreditCard"])
        
    }
}
