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
    
    //Creating an array of the custom class alertTextFieldContents
    
    var notesInTableViewArray = [alertTextFieldContents]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Configuring The TableView.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = notesInTableViewArray[indexPath.row].titleTextField
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesInTableViewArray.count;
    }
    //Add Note Button
    @IBAction func addNewValue(sender: UIButton) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Create A Note", message: "Please fill the parameters", preferredStyle: .Alert)
        
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
            let notesTextField = alert.textFields![1] as UITextField
            //Placing the contents of the two textfields into the a buffer.
            
            var currentContent = alertTextFieldContents()
            currentContent.titleTextField = titleTextField.text!
            currentContent.notesTextField = notesTextField.text!
            self.notesInTableViewArray.append(currentContent)
            self.tableViewOutlet.reloadData()
            //Printing the contents into the console so that you can see if they are recieving the text from the UITextField.
            print(" Title Text field: \(currentContent.titleTextField)")
            print("Notes Text field: \(currentContent.notesTextField)")
        }))
        
        // 4. Present the alert.
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //print(alertTextFieldContentsInViewController)
        let nextViewController = segue.destinationViewController as! secondViewController
        var indexPath = tableViewOutlet.indexPathForSelectedRow!
        var selectedTableCell = notesInTableViewArray[indexPath.row]
        
        
        
        nextViewController.alertTextFieldContentsInSecondViewController = selectedTableCell
        
    }


}