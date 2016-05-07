//
//  CalendarView.swift
//  rcpt
//
//  Created by Ingwar Wirjawan on 20/4/16.
//  Copyright © 2016 gts. All rights reserved.
//

import UIKit

protocol OVAddPersonDialogViewDelegate: NSObjectProtocol{
    func onClose()
    func onOpen()
}

public class CalendarView: UIView {
    
    private var navigationController: UINavigationController?
    private var menuArrow: UIImageView!
    private var menuTitle: UILabel!
    private var menuButton: UIButton!
    private var menuWrapper: UIView!
    private var topSeparator: UIView!
    private var backgroundView: UIView!
    
    private var selectedMonth: Int
    private var selectedYear: Int
    private var prevSelected: Int
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(title: String, month: Int, year: Int) {
        self.init(navigationController: nil, month: month, year: year)
    }
    
    public init(navigationController: UINavigationController?, month: Int, year: Int) {
        self.navigationController = navigationController
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1.0)
        
        let font = UIFont(name: "HelveticaNeue-Bold", size:17)!
        let text = "2016"
        // Get titleSize
        let titleSize = (text as NSString).sizeWithAttributes([NSFontAttributeName: font])
        let arrowImage = UIImage(named: "red button")!
        
        // Set frame
        let frame = CGRectMake(0, 0, titleSize.width + 20 + (arrowImage.size.width * 2),
                               self.navigationController!.navigationBar.frame.height)
        
        self.selectedMonth = month
        self.selectedYear = year
        self.prevSelected = month-1
        
        print("\(self.selectedMonth) \(self.selectedYear)")
        
        super.init(frame:frame)
        
        self.navigationController?.view.addObserver(self, forKeyPath: "frame", options: .New, context: nil)
        
        
        self.menuButton = UIButton(frame: frame)
        self.addSubview(self.menuButton)
        
        self.menuButton.setImage(arrowImage, forState: .Normal)
        self.menuButton.setTitle(text, forState: .Normal)
        
        self.menuButton.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                       left: -(arrowImage.size.width * 2),
                                                       bottom: 0,
                                                       right: 0)
        
        self.menuButton.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                       left: 0,
                                                       bottom: 0,
                                                       right: -(titleSize.width * 2 + 20))
        
        let window = UIApplication.sharedApplication().keyWindow!
        let menuWrapperBounds = window.bounds
        
        //self.navigationController!.navigationBar.barTintColor = UIColor.grayColor()
        
        let scrollView = JAScrollView(width: menuWrapperBounds.width, height: 129)
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let sides = (menuWrapperBounds.size.width - (6*40) - (5*10)) / 2
        
        var views = [UIView]()
    
        for j in 0...2 {
            let x = j*10
            let view = UIView(frame: CGRect(x: 0, y: 0, width: menuWrapperBounds.size.width, height: 120))
            
            for i in 0...5 {
                
                let label = UIButton(frame: CGRectMake(sides + CGFloat(i*50), 15, 40, 40))
                label.setTitle(months[i], forState: .Normal)
                label.layer.cornerRadius = 0.5*label.bounds.size.width
                label.titleLabel!.font = UIFont(name: "HelveticaNeue-Thin", size: 14)
                label.backgroundColor = UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1.0)
                label.setTitleColor(UIColor.redColor(), forState: UIControlState.Selected)
                label.addTarget(self, action: #selector(self.buttonAction), forControlEvents: .TouchUpInside)
                label.tag = x+i
                
                print("\(label.tag)")
                
                view.addSubview(label)
                let label2 = UIButton(frame: CGRectMake(sides + CGFloat(i*50), 65, 40, 40))
                label2.setTitle(months[i+6], forState: .Normal)
                label2.layer.cornerRadius = 0.5*label2.bounds.size.width
                label2.titleLabel!.font = UIFont(name: "HelveticaNeue-Thin", size: 14)
                label2.backgroundColor = UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1.0)
                label2.setTitleColor(UIColor.redColor(), forState: UIControlState.Selected)
                label2.addTarget(self, action: #selector(self.buttonAction), forControlEvents: .TouchUpInside)
                label2.tag = x+i+6

                view.addSubview(label2)
            }
            view.backgroundColor = UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1.0)
            views.append(view)
        }
        
       // let prev = self.viewWithTag(self.prevSelected) as? UIButton
       // prev!.backgroundColor = UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1.0)
       // prev!.setTitleColor(UIColor.redColor(), forState: UIControlState.Selected)
        
        scrollView.numPages = views.count
        scrollView.viewObjects = views
        
        scrollView.setup()
        
        // Set up DropdownMenu
        self.menuWrapper = UIView(frame: CGRectMake(menuWrapperBounds.origin.x, 0, menuWrapperBounds.width, menuWrapperBounds.height))
        self.menuWrapper.clipsToBounds = true
        self.menuWrapper.autoresizingMask = UIViewAutoresizing.FlexibleWidth.union(UIViewAutoresizing.FlexibleHeight)
        
        // Init background view (under table view)
        self.backgroundView = UIView(frame: menuWrapperBounds)
        self.backgroundView.backgroundColor = UIColor.blackColor()
        self.backgroundView.autoresizingMask = UIViewAutoresizing.FlexibleWidth.union(UIViewAutoresizing.FlexibleHeight)
        
        //let backgroundTapRecognizer = UITapGestureRecognizer(target: self, action: "hideMenu");
        //self.backgroundView.addGestureRecognizer(backgroundTapRecognizer)
        
        
        // Add background view & table view to container view
        self.menuWrapper.addSubview(self.backgroundView)
        self.menuWrapper.addSubview(scrollView)
        
        // Add Line on top
        self.topSeparator = UIView(frame: CGRectMake(0, 0, menuWrapperBounds.size.width, 0.5))
        self.topSeparator.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        self.menuWrapper.addSubview(self.topSeparator)
        
        self.menuWrapper.frame.origin.y = self.navigationController!.navigationBar.frame.maxY
        //scrollView.frame.origin.y = 0 //self.navigationController!.navigationBar.frame.height //-CGFloat(200) * 50 - 300
        
        self.menuWrapper.superview?.bringSubviewToFront(self.menuWrapper)
        UIView.animateWithDuration(
            5 * 1.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: [],
            animations: {
                scrollView.frame.origin.y =  0//-CGFloat(300)// * 50 - 300;
                self.backgroundView.alpha = 0.3
            }, completion: nil
        )
        window.addSubview(self.menuWrapper)
    }
    
    func buttonAction(sender: UIButton!) {
        print("\(sender.tag)")
        sender.backgroundColor = .whiteColor()
        sender.setTitleColor(UIColor.redColor(), forState: .Normal)
        
        print("prev selected: \(self.prevSelected)")
        
        //let prev = self.viewWithTag(self.prevSelected) as? UIButton
        //prev!.backgroundColor = UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1.0)
        //prev!.setTitleColor(UIColor.redColor(), forState: UIControlState.Selected)

    }

}
