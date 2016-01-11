//
//  ViewController.swift
//  SuperNote
//
//  Created by student1 on 1/7/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//
//Test

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var myArray = ["Tom", "Jim","Bob","Justin", "Sally"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = myArray[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count;
    }
    
    @IBAction func addNewValue(sender: UIButton) {
    myArray.append(<#T##newElement: String##String#>)
        
    }





}