//
//  JAScrollView.swift
//  rcpt
//
//  Created by Ingwar Wirjawan on 19/4/16.
//  Copyright © 2016 gts. All rights reserved.
//

import Foundation
import UIKit

class JAScrollView : UIScrollView, UIScrollViewDelegate {
    var viewObjects: [UIView]?
    var numPages: Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, items: [AnyObject]) {
        self.init(width: 300, height: 300)
    }
    
    init(width: CGFloat, height: CGFloat) {
        super.init(frame: CGRectMake(0, 0, width, height))
        
        pagingEnabled = true
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        scrollsToTop = false
        delegate = self
    }
    
    func setup() {
        //guard let parent = superview else { return }
        
        //print ("frame.size.width: \(frame.size.width)")
        
        contentSize = CGSize(width: (frame.size.width * (CGFloat(numPages) + 2)), height: frame.size.height)
    
        loadScrollViewWithPage(0)
        loadScrollViewWithPage(1)
        loadScrollViewWithPage(2)
        
        var newFrame = frame
        newFrame.origin.x = frame.size.width
        newFrame.origin.y = 0
        scrollRectToVisible(newFrame, animated: false)
        
        layoutIfNeeded()
    }
    
    private func loadScrollViewWithPage(page: Int) {
        if page < 0 { return }
        if page >= numPages + 2 { return }
        
        var index = 0
        
        //index = (page + numPages) % numPages
        
         if page == 0 {
         index = numPages - 1
         } else if page == numPages + 1 {
         index = 0
         } else {
         index = page - 1
         }
        
        print("page : \(page) index: \(index)")
        
        let view = viewObjects?[index]
        
        var newFrame = frame
        newFrame.origin.x = frame.size.width * CGFloat(page)
        newFrame.origin.y = 0
        view?.frame = newFrame
        print("\(newFrame)")
    
         if view?.superview == nil {
            print("add SubView")
            addSubview(view!)
         }
        
        layoutIfNeeded()
    }
    
    @objc internal func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = frame.size.width
        let page = floor((contentOffset.x - (pageWidth/2)) / pageWidth) + 1
        
        //print("scrollView \(page)")
        
        //if contentOffset.x < 0 {
            loadScrollViewWithPage(Int(page-1))
            loadScrollViewWithPage(Int(page))
            loadScrollViewWithPage(Int(page+1))
        //}
        //print("\(contentOffset.x)")
        
        //loadScrollViewWithPage(Int(page - 1))
        //loadScrollViewWithPage(Int(page))
        //loadScrollViewWithPage(Int(page + 1))
    }
    
    @objc internal func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth = frame.size.width
        let page : Int = Int(floor((contentOffset.x - (pageWidth/2)) / pageWidth) + 1)
        
        print("decel \(page)")
        if page == 0 {
            contentOffset = CGPoint(x: frame.size.width * CGFloat(numPages), y: 0)
        } else if page == numPages+1 {
            contentOffset = CGPoint(x: frame.size.width, y: 0)
        }
    }
    
}