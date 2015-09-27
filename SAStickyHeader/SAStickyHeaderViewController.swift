//
//  SAStickyHeaderViewController.swift
//  SAStickyHeader
//
//  Created by Stefan Arambasich on 9/17/2015.
//  Copyright (c) 2015 Stefan Arambasich. All rights reserved.
//

import UIKit

/**
    Class implementing a sticky header layout.
*/
class SAStickyHeaderViewController: UIViewController, UIScrollViewDelegate {
    /// The header view itself, or the behind view
    @IBOutlet weak var headerView: UIView!
    /// The scroll view containing our content, or the front view.
    @IBOutlet weak var scrollView: UIScrollView!
    
    /// Default header height - how tall to set the header view
    /// when the scroll offset is zero.
    var headerHeightDefault: CGFloat = 192.0
    
    /// Whether to hide the navigation bar when the top of the table
    /// view content is reached via scrolling
    var hidesNavigationBar: Bool = true {
        didSet {
            if hidesNavigationBar {
                scrollViewDidScroll(scrollView)
            } else {
                navigationController?.navigationBar.alpha = 1.0
            }
        }
    }
    
    /// The constraint dictating the height of the header view
    var headerHeightConstraint: NSLayoutConstraint! {
        if let c = headerView.constraints.filter({ $0.firstItem === self.headerView && $0.firstAttribute == NSLayoutAttribute.Height }).first {
            return c
        }
        
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    /**
        Finalizes and sets all views to their 'initial' state.
    */
    private func configureViews() {
        if headerView.superview != view {
            view.addSubview(headerView)
        }
        
        if scrollView.superview != view {
            view.addSubview(scrollView)
        }
        
        if headerHeightConstraint == nil {
            let c = NSLayoutConstraint(item: headerView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: headerHeightDefault)
            headerView.addConstraint(c)
        }
        
        removeNavBarBottomLine()
        
        scrollView.contentInset = UIEdgeInsets(top: headerHeightDefault, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentOffset = CGPoint(x: 0.0, y: -headerHeightDefault)
        scrollView.delegate = self
        
        scrollViewDidScroll(scrollView)
    }
    
    /**
        Removes the navigation bar's bottom line.
    */
    func removeNavBarBottomLine() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    }
    

    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let deltaUnits = scrollView.contentOffset.y + headerHeightDefault
            let height = max(0, min(headerHeightDefault - deltaUnits, headerHeightDefault - deltaUnits))
            headerHeightConstraint.constant = height
            
            if hidesNavigationBar {
                let alpha: CGFloat
                switch deltaUnits {
                case -CGFloat.max ..< headerHeightDefault - 64.0:
                    alpha = 0.0
                case headerHeightDefault - 64.0 ..< headerHeightDefault:
                    let a = 1.0 - ((headerHeightDefault - deltaUnits) / 64.0)
                    alpha = a
                default:
                    alpha = 1.0
                }
                navigationController?.navigationBar.alpha = alpha
            }
        }
    }
}
