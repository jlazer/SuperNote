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
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
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
        //1. Create the alert controller.
        var alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .Alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextFieldWithConfigurationHandler({ (titleTextField) -> Void in
            titleTextField.text = "Title."
            
        })
        
        alert.addTextFieldWithConfigurationHandler({ (notesTextField) -> Void in
            notesTextField.text = "Notes."
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let titleTextField = alert.textFields![0] as UITextField
            let notesTextField = alert.textFields![0] as UITextField
            print("Text field: \(titleTextField.text)")
            print(
            self.myArray.append(titleTextField.text!)
            self.tableViewOutlet.reloadData()
        }))
        
        // 4. Present the alert.
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    





}