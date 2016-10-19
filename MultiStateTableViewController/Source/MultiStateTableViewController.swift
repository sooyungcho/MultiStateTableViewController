//
//  MultiStateTableViewController.swift
//
//  MultiStateTableViewController implements a table view that can simply be transformed
//  into a loading state or an empty result state.
//
//  Created by Soo-Yung Cho on 8/22/15.
//  Copyright (c) 2015 Soo Yung Cho. All rights reserved.
//

import UIKit

class MultiStateTableViewController: UIViewController {

    var mainTableView: UITableView
    var mainActivityIndicatorView: UIActivityIndicatorView
    var mainMessageLabel: UILabel

    init(tableStyle: UITableViewStyle) {
        self.mainTableView = UITableView(frame: UIScreen.main.bounds, style: tableStyle)
        self.mainActivityIndicatorView = UIActivityIndicatorView()
        self.mainMessageLabel = UILabel()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainTableView.translatesAutoresizingMaskIntoConstraints = false

        self.mainActivityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.mainActivityIndicatorView.activityIndicatorViewStyle = .gray
        self.mainActivityIndicatorView.hidesWhenStopped = true

        self.mainMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.mainMessageLabel.font = UIFont.systemFont(ofSize: 16.0)
        self.mainMessageLabel.textColor = UIColor.lightGray
        self.mainMessageLabel.textAlignment = .center
        self.mainMessageLabel.numberOfLines = 0
        self.mainMessageLabel.isHidden = true

        self.view.addSubview(self.mainTableView)
        self.view.addSubview(self.mainActivityIndicatorView)
        self.view.addSubview(self.mainMessageLabel)

        self.setViewConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func showTable() {
        self.mainActivityIndicatorView.stopAnimating()
        self.mainMessageLabel.isHidden = true

        self.mainTableView.isHidden = false
    }

    func showLoading() {
        self.mainTableView.isHidden = true
        self.mainMessageLabel.isHidden = true

        self.mainActivityIndicatorView.startAnimating()
    }

    func showMessage(message: String) {
        self.mainActivityIndicatorView.stopAnimating()
        self.mainTableView.isHidden = true

        self.mainMessageLabel.text = message
        self.mainMessageLabel.isHidden = false
    }

    private func setViewConstraints() {
        let viewsDictionary = ["mainTableView": self.mainTableView, "mainActivityIndicatorView": self.mainActivityIndicatorView, "mainMessageLabel": self.mainMessageLabel] as [String : Any]

        let mainTableViewHeightCrt: Array = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mainTableView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let mainTableViewWidthCrt: Array = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[mainTableView]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)

        self.view.addConstraints(mainTableViewHeightCrt)
        self.view.addConstraints(mainTableViewWidthCrt)

        self.view.addConstraint(NSLayoutConstraint(item: self.mainActivityIndicatorView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.mainActivityIndicatorView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0.0))

        let mainMessageLabelHeightCrt: Array = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mainMessageLabel]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let mainMessageLabelWidthCrt: Array = NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[mainMessageLabel]-15-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        self.view.addConstraints(mainMessageLabelHeightCrt)
        self.view.addConstraints(mainMessageLabelWidthCrt)
    }
    
}
