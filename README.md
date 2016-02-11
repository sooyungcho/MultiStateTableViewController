# MultiStateTableViewController

## Goal

MultiStateTableViewController allow you to simply implement a table view that has multiple states. The view can simply transform into a loading state or an empty result state depending on the current state of your table data.

![Alt text](/multi_state_main_screens.png?raw=true "Loading State of MultiStateTableViewController")

## Usage

You can simply copy MultiStateTableViewController.swift file into your project and create your own view controller that is a sub-class of MultiStateTableViewController:
```swift
class YourMultiStateTableViewController : MultiStateTableViewController {
  // Your code ...
}
```
In order to show the loading state, just call showLoading() method from your view controller. For example. you can turn the view into the loading state when you are calling REST API to get the data for your table view:
```swift
self.showLoading()
// Call API to get the data for the table view ...
```
When the API has returned the data, you can reload the table data and call showTable() to hide the loading state:
```swift
// API returned results ...
self.mainTableView?.reloadData()
self.showTable()
```

If your API somehow returned nothing for your request, you can use showMessage(message: String) method to tell user what happened:
```swift
// API returned nothing ...
self.showMessage("Your table is empty")
```
