//
//  ScrollView.swift
//  TableViewsInScrollView
//
//  Created by Paul Wong on 6/24/15.
//  Copyright (c) 2015 PW. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView {

    var isTableViewScrolling = false
    
    init() {
        super.init(frame: CGRectZero)
        
        NSNotificationCenter.defaultCenter().addObserverForName("isScrolling", object: nil, queue: nil) {
            [weak self] notification in

            if let userInfo = notification.userInfo as? [String: Bool] {
                self?.isTableViewScrolling = userInfo["isScrolling"]!
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if !self.isTableViewScrolling {
            return false
        }

        return true
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOfGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return false
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailByGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if self.isTableViewScrolling && gestureRecognizer.view!.isKindOfClass(UIScrollView.self) && otherGestureRecognizer.view!.isKindOfClass(UITableView.self) {
            return true
        }
        
        return false
    }
    
    override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer.isKindOfClass(UIPanGestureRecognizer.self) {
            if let gesture = gestureRecognizer as? UIPanGestureRecognizer {
                let velocity = gesture.velocityInView(self)
                if (abs(velocity.y)*2) <= abs(velocity.x) {
                    return true
                }
            }
        }
        
        return false
    }

}
