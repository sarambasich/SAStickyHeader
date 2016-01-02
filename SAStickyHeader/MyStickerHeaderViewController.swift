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
        
        hidesNavigationBar = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        super.scrollViewDidScroll(scrollView)
        
        
    }
    
    // MARK: Event handlers
    @IBAction private func didSelectBarButtonItem(sender: UIBarButtonItem) {
        print(sender.description)
    }
    
    
    // MARK: - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = "Cell #\(indexPath.row)"
        return cell
    }
}
