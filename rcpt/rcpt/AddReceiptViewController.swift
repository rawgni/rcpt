//
//  ViewController.swift
//  rcpt
//
//  Created by Ingwar Wirjawan on 23/3/16.
//  Copyright © 2016 gts. All rights reserved.
//

import UIKit

protocol AddReceiptViewControllerDelegate: class {
    func addReceiptViewControllerDidCancel(controller: AddReceiptViewController)
    func addReceiptViewController(controller: AddReceiptViewController,
                                  didFinishAddingItem item: Receipt)
}

class AddReceiptViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    
    weak var delegate: AddReceiptViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        print(NSDate())
        dateField.text = dateFormatter.stringFromDate(NSDate())
        print(dateField.text)
        //numberField.becomeFirstResponder()
    }

    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                    replacementString string: String) -> Bool {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        print("length: \(newText.length)")
        return true
    }
    

    @IBAction func cancel() {
        delegate?.addReceiptViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        let receipt = Receipt()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        print("HELLO")
        print(dateField.text!)
        
        receipt.when = dateFormatter.dateFromString(dateField.text!)!
        receipt.from = fromField.text!
        receipt.desc = descField.text!
        receipt.amount = Double(amountField.text!)!
        
        delegate?.addReceiptViewController(self, didFinishAddingItem: receipt)
    }
    
    @IBAction func dateEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(AddReceiptViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    // 7
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        dateField.text = dateFormatter.stringFromDate(sender.date)
        
    }
}

