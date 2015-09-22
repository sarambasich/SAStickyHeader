//
//  MyStickerHeaderViewController.swift
//  SAStickyHeader
//
//  Created by Stefan Arambasich on 9/17/2015.
//  Copyright (c) 2015 Stefan Arambasich. All rights reserved.
//

import UIKit

class MyStickerHeaderViewController: SAStickyHeaderViewController, UITableViewDataSource, UITableViewDelegate {
    /// Table view
    @IBOutlet private weak var tableView: UITableView!
    /// Sticky header's image
    @IBOutlet private weak var stickyHeaderImage: UIImageView!
    
    /// Label's center Y constraint
    @IBOutlet private weak var labelCenterY: NSLayoutConstraint!
    
    /// Image view top constraint
    @IBOutlet private weak var imageViewTopConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        super.scrollViewDidScroll(scrollView)
        
        if scrollView === tableView {
            let deltaUnits = scrollView.contentOffset.y + headerHeightDefault
            let scale: CGFloat = 1 + fabs(deltaUnits / headerHeightDefault)
            if scrollView.contentOffset.y < -headerHeightDefault {
                stickyHeaderImage.transform = CGAffineTransformMakeScale(scale, scale)
            } else {
                stickyHeaderImage.transform = CGAffineTransformIdentity
            }
            
            
            switch deltaUnits {
            case -CGFloat.max ..< headerHeightDefault - 64.0:
                imageViewTopConstraint.constant = -(0.3 * deltaUnits)
            case headerHeightDefault - 64.0 ..< headerHeightDefault:
                imageViewTopConstraint.constant = -(0.3 * deltaUnits)
            default:
                imageViewTopConstraint.constant = 0.0
            }
            
            view.layoutIfNeeded()
        }
    }
    
    // MARK: Event handlers
    @IBAction private func didSelectBarButtonItem(sender: UIBarButtonItem) {
        println(sender.description)
    }
    
    
    // MARK: - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = "Cell #\(indexPath.row)"
        return cell
    }
}
