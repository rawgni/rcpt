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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receipts!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReceiptCell", forIndexPath: indexPath)

        // Configure the cell...
        let receipt = receipts[indexPath.row] as Receipt
        cell.textLabel?.text = receipt.name
        cell.detailTextLabel?.text = receipt.notes + "\n" + receipt.notes

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
