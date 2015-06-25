//
//  TableViewController.swift
//  TableViewsInScrollView
//
//  Created by Paul Wong on 6/24/15.
//  Copyright (c) 2015 PW. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var isScrolling = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel?.text = "Test"

        return cell
    }

}

extension TableViewController: UIScrollViewDelegate {
    
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        println("scrollViewWillBeginDragging")
        self.isScrolling = true
        NSNotificationCenter.defaultCenter().postNotificationName("isScrolling", object: nil,
            userInfo: ["isScrolling": self.isScrolling])
    }
    
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        println("scrollViewWillEndDragging")
    }
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            println("scrollViewDidEndDragging")
            self.isScrolling = false
            NSNotificationCenter.defaultCenter().postNotificationName("isScrolling", object: nil,
                userInfo: ["isScrolling": self.isScrolling])
        }
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        println("scrollViewDidEndDecelerating")
        self.isScrolling = false
        NSNotificationCenter.defaultCenter().postNotificationName("isScrolling", object: nil,
            userInfo: ["isScrolling": self.isScrolling])
    }
    
    override func scrollViewDidScrollToTop(scrollView: UIScrollView) {
        println("scrollViewDidScrollToTop")
        self.isScrolling = false
        NSNotificationCenter.defaultCenter().postNotificationName("isScrolling", object: nil,
            userInfo: ["isScrolling": self.isScrolling])
    }
    
    override func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        println("scrollViewDidEndScrollingAnimation")
        self.isScrolling = false
        NSNotificationCenter.defaultCenter().postNotificationName("isScrolling", object: nil,
            userInfo: ["isScrolling": self.isScrolling])
    }
    
}
