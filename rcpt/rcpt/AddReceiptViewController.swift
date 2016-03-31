//
//  ViewController.swift
//  rcpt
//
//  Created by Ingwar Wirjawan on 23/3/16.
//  Copyright © 2016 gts. All rights reserved.
//

import UIKit
//import RealmSwift

protocol AddReceiptViewControllerDelegate: class {
    func addReceiptViewControllerDidCancel(controller: AddReceiptViewController)
    func addReceiptViewController(controller: AddReceiptViewController,
                                  didFinishAddingItem item: Receipt)
}

class AddReceiptViewController: UITableViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var receivedFromField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet var receiptTableView: UITableView!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddReceiptViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //dateField.becomeFirstResponder()
        self.receiptTableView.tableFooterView = UIView()

    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }

    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                    replacementString string: String) -> Bool {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        doneBarButton.enabled = (newText.length > 0)
        
        print("length: \(newText.length)")
        return true
    }
    

    @IBAction func cancel() {
        delegate?.addReceiptViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        let receipt = Receipt()
        receipt.name = receivedFromField.text!
        receipt.notes = amountField.text!
        
        /*
        try! uiRealm.write({ () -> Void in
            uiRealm.add(receipt)
        }) */
        
        delegate?.addReceiptViewController(self, didFinishAddingItem: receipt)
    }
    
    @IBAction func datePickerTapped(sender: AnyObject) {
    }
}

