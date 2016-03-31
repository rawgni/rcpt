//
//  DatePickerViewController.swift
//  rcpt
//
//  Created by Ingwar Wirjawan on 31/3/16.
//  Copyright © 2016 gts. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        datePicker.addTarget(self, action: #selector(DatePickerViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
        let dateformatter = NSDateFormatter()
        
        dateformatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateformatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        dateLabel.text = dateformatter.stringFromDate(NSDate())
    }
    
    func datePickerValueChanged (datePicker: UIDatePicker) {
        
        let dateformatter = NSDateFormatter()
        
        dateformatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateformatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        let dateValue = dateformatter.stringFromDate(datePicker.date)
        
        dateLabel.text = dateValue
    }
}
