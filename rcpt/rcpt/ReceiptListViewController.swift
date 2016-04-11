//
//  ReceiptViewController.swift
//  rcpt
//
//  Created by Ingwar Wirjawan on 26/3/16.
//  Copyright © 2016 gts. All rights reserved.
//

import UIKit
import RealmSwift

class ReceiptListViewController: UITableViewController, AddReceiptViewControllerDelegate {
    
    @IBOutlet var receiptListTableView: UITableView!
    var receipts: Results<Receipt>!
    
    override func viewDidLoad() {
        receipts = uiRealm.objects(Receipt)
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.receiptListTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(animated: Bool) {
        readTasksAndUpdateUI()
    }
    
    func readTasksAndUpdateUI() {
        self.receiptListTableView.setEditing(false, animated: true)
        self.receiptListTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if (section == 0) {
        //    return receipts!.count
        //}
        return receipts!.count
    }
    
    var sections: [String] = ["This Month", "This Year"]
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
 */
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    /*
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Futura", size: 5)!
        header.contentView.backgroundColor = UIColor(red: 0/255, green: 181/255, blue: 229/255, alpha: 1.0) //make the background color light blue
        header.textLabel?.textColor = UIColor.whiteColor() //make the text white
        header.alpha = 0.5 //make the header transparent
    }*/
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReceiptCell", forIndexPath: indexPath) as! ReceiptCell

        // Configure the cell...
        let receipt = receipts[indexPath.row] as Receipt
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        cell.nameLabel?.text = receipt.from
        cell.infoLabel?.text = dateFormatter.stringFromDate(receipt.when) + " - " + receipt.desc
        cell.amountLabel?.text = String(receipt.amount)
        
        cell.amountLabel.layer.masksToBounds = true
        cell.amountLabel.layer.cornerRadius = 10.0

        return cell
    }
    
    func addReceiptViewControllerDidCancel(controller: AddReceiptViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func addReceiptViewController(controller: AddReceiptViewController, didFinishAddingItem item: Receipt) {        
        try! uiRealm.write({ () -> Void in
         uiRealm.add(item)
        })
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItem" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! AddReceiptViewController
            
            controller.delegate = self
        }
    }
}
