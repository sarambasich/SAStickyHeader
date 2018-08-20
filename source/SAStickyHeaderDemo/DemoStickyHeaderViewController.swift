//
//  DemoStickyHeaderViewController.swift
//  SAStickyHeader
//
//  Created by Stefan Arambasich on 9/17/2015.
//  Copyright (c) 2015 Stefan Arambasich. All rights reserved.
//

import Foundation
import UIKit

import SAStickyHeader



class DemoStickyHeaderViewController: SAStickyHeaderViewController, UITableViewDataSource, UITableViewDelegate {

    /// Table view
    @IBOutlet fileprivate weak var tableView: UITableView!
    /// Sticky header's image
    @IBOutlet fileprivate weak var stickyHeaderImage: UIImageView!
    
    /// Label's center Y constraint
    @IBOutlet fileprivate weak var labelCenterY: NSLayoutConstraint!
    
    /// Image view top constraint
    @IBOutlet fileprivate weak var imageViewTopConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hidesNavigationBar = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        super.scrollViewDidScroll(scrollView)
        
        
    }
    
    // MARK: Event handlers
    @IBAction fileprivate func didSelectBarButtonItem(_ sender: UIBarButtonItem) {
        print(sender.description)
    }
    
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "Cell #\((indexPath as NSIndexPath).row)"
        return cell
    }
}
