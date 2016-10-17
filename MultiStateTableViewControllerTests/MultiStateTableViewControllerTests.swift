//
//  MultiStateTableViewControllerTests.swift
//  MultiStateTableViewControllerTests
//
//  Created by Soo-Yung Cho on 2/8/16.
//  Copyright © 2016 Soo Yung Cho. All rights reserved.
//

import XCTest
@testable import MultiStateTableViewController

class MultiStateTableViewControllerTests: XCTestCase {

    var multiStateTableViewController: MultiStateTableViewController?

    override func setUp() {
        super.setUp()

        self.multiStateTableViewController = MultiStateTableViewController()
        self.multiStateTableViewController?.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMultiStates() {
        self.multiStateTableViewController?.showLoading()
        XCTAssert(self.multiStateTableViewController?.mainTableView.isHidden == true)
        XCTAssert(self.multiStateTableViewController?.mainActivityIndicatorView.isHidden == false)
        XCTAssert(self.multiStateTableViewController?.mainMessageLabel.isHidden == true)

        self.multiStateTableViewController?.showTable()
        XCTAssert(self.multiStateTableViewController?.mainTableView.isHidden == false)
        XCTAssert(self.multiStateTableViewController?.mainActivityIndicatorView.isHidden == true)
        XCTAssert(self.multiStateTableViewController?.mainMessageLabel.isHidden == true)

        self.multiStateTableViewController?.showMessage("Your table is empty")
        XCTAssert(self.multiStateTableViewController?.mainTableView.isHidden == true)
        XCTAssert(self.multiStateTableViewController?.mainActivityIndicatorView.isHidden == true)
        XCTAssert(self.multiStateTableViewController?.mainMessageLabel.isHidden == false)
        XCTAssertEqual(self.multiStateTableViewController?.mainMessageLabel.text, "Your table is empty")
    }
    
}
