//
//  ViewController.swift
//  TableViewsInScrollView
//
//  Created by Paul Wong on 6/24/15.
//  Copyright (c) 2015 PW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = ScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup paginated scrollView
        self.scrollView.pagingEnabled = true
        self.scrollView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.scrollView.alwaysBounceHorizontal = true
        self.scrollView.bounces = true
        self.scrollView.frame = CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height)
        self.view.addSubview(self.scrollView)
        
        // setup autolayout constraints for scrollView
        let viewsDictionary = ["scrollView": scrollView]
        let widthConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        let heightConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
        
        self.view.addConstraints(widthConstraint)
        self.view.addConstraints(heightConstraint)
        
        // add VCs to the scrollView
        var viewControllers: [UIViewController] = []
        for index in 0..<5 {
            let tableVC = self.storyboard!.instantiateViewControllerWithIdentifier("TableViewController") as! TableViewController
            viewControllers.append(tableVC)
        }
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * CGFloat(viewControllers.count), 0.0)
        
        for (index, viewController) in enumerate(viewControllers) {
            viewController.willMoveToParentViewController(self)
            
            viewController.view.frame = CGRectMake(self.view.frame.width * CGFloat(index), 0.0, self.view.frame.width,
                self.view.frame.height)
            
            self.addChildViewController(viewController)
            self.scrollView.addSubview(viewController.view)
            viewController.didMoveToParentViewController(self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

