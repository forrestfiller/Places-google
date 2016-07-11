//
//  ViewController.swift
//  Places-google
//
//  Created by Forrest Filler on 7/11/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var venueTable: UITableView!
    var searchField: UITextField!
    var venueList = Array<Venue>()
    
    override func loadView() {
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .whiteColor()
        
        self.searchField = UITextField(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 44))
        searchField.backgroundColor = .lightGrayColor()
        self.searchField.delegate = self
        
        self.venueTable = UITableView(frame: frame, style: .Plain)
        self.venueTable.dataSource = self
        self.venueTable.delegate = self
        self.venueTable.tableHeaderView = searchField
        view.addSubview(self.venueTable)
        
        self.view = view
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.venueList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let venue = self.venueList[indexPath.row]
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = venue.name
            cell.detailTextLabel?.text = venue.address
            return cell
        }
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = venue.name
        cell.detailTextLabel?.text = venue.address
        return cell
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("textFieldShouldReturn: ")
        textField.resignFirstResponder()
        let searchText = self.searchField.text!
        self.venueList.removeAll()
        
        return true
    }


    
    
    
    
    
    // Fin! ....
}

