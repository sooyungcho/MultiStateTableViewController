//
//  MultiStateTableViewController.swift
//  
//  MultiStateTableViewController allow you to simply implement a table view that has
//  multiple states. The view can simply transform into a loading state or an empty result
//  state depending on the current state of your table data.
//
//  Created by Soo-Yung Cho on 8/22/15.
//  Copyright (c) 2015 Soo Yung Cho. All rights reserved.
//

import UIKit

class MultiStateTableViewController: UIViewController {

    var mainTableView: UITableView?
    var mainActivityIndicatorView: UIActivityIndicatorView?
    var mainMessageLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainTableView = UITableView()
        self.mainTableView?.translatesAutoresizingMaskIntoConstraints = false

        self.mainActivityIndicatorView = UIActivityIndicatorView()
        self.mainActivityIndicatorView?.translatesAutoresizingMaskIntoConstraints = false
        self.mainActivityIndicatorView?.activityIndicatorViewStyle = .Gray
        self.mainActivityIndicatorView?.hidesWhenStopped = true

        self.mainMessageLabel = UILabel()
        self.mainMessageLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.mainMessageLabel?.font = UIFont.systemFontOfSize(16.0)
        self.mainMessageLabel?.textColor = UIColor.lightGrayColor()
        self.mainMessageLabel?.textAlignment = .Center
        self.mainMessageLabel?.numberOfLines = 0
        self.mainMessageLabel?.hidden = true

        self.view.addSubview(self.mainTableView!)
        self.view.addSubview(self.mainActivityIndicatorView!)
        self.view.addSubview(self.mainMessageLabel!)

        self.setViewConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func showTable() {
        self.mainActivityIndicatorView?.stopAnimating()
        self.mainMessageLabel?.hidden = true

        self.mainTableView?.hidden = false
    }

    func showLoading() {
        self.mainTableView?.hidden = true
        self.mainMessageLabel?.hidden = true

        self.mainActivityIndicatorView?.startAnimating()
    }

    func showMessage(message: String) {
        self.mainActivityIndicatorView?.stopAnimating()
        self.mainTableView?.hidden = true

        self.mainMessageLabel?.text = message
        self.mainMessageLabel?.hidden = false
    }

    private func setViewConstraints() {
        let viewsDictionary = ["mainTableView": self.mainTableView!, "mainActivityIndicatorView": self.mainActivityIndicatorView!, "mainMessageLabel": self.mainMessageLabel!]

        let mainTableViewHeightCrt: Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[mainTableView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let mainTableViewWidthCrt: Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[mainTableView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)

        self.view.addConstraints(mainTableViewHeightCrt)
        self.view.addConstraints(mainTableViewWidthCrt)

        self.view.addConstraint(NSLayoutConstraint(item: self.mainActivityIndicatorView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.mainActivityIndicatorView!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))

        let mainMessageLabelHeightCrt: Array = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[mainMessageLabel]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let mainMessageLabelWidthCrt: Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[mainMessageLabel]-15-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)

        self.view.addConstraints(mainMessageLabelHeightCrt)
        self.view.addConstraints(mainMessageLabelWidthCrt)
    }

}
