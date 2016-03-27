//
//  ViewController.swift
//  rcpt
//
//  Created by Ingwar Wirjawan on 23/3/16.
//  Copyright © 2016 gts. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var notesField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func saveReceipt(sender: UIButton) {
        let receipt = Receipt()
        receipt.name = titleField.text!
        receipt.notes = notesField.text!
        
        try! uiRealm.write({ () -> Void in
            uiRealm.add(receipt)
        })
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}

