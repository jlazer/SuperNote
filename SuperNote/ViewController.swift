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
    
    var alertTextFieldContentsInViewController = alertTextFieldContents()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var notesInTableViewArray = [alertTextFieldContents]()
    //var alertTextFieldDictionary: Dictionary<String, String> = ["titleTextFieldKey":"","notesTextFieldKey":""]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Configuring The TableView.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = notesInTableViewArray[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesInTableViewArray.count;
    }
    //Add Note Button
    @IBAction func addNewValue(sender: UIButton) {
        //1. Create the alert controller.
        var alert = UIAlertController(title: "Create A Note", message: "Please fill the parameters", preferredStyle: .Alert)
        
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
            //Placing the contents of the two textfields into the class so that they can be passed to the next viewcontroller.
            self.alertTextFieldContentsInViewController.titleTextField = (titleTextField.text!)
            self.alertTextFieldContentsInViewController.notesTextField = (notesTextField.text!)
            
            //self.alertTextFieldDictionary["titleTextFieldKey"] = titleTextField.text
            //self.alertTextFieldDictionary["notesTextFieldKey"] = notesTextField.text
            //Printing the contents into the console so that you can see if they are recieving the text from the UITextField.
            //print(" Title Text field: \(self.alertTextFieldContentsInViewController.titleTextField)")
            //print("Notes Text field: \(self.alertTextFieldContentsInViewController.notesTextField)")
            self.notesInTableViewArray.append(alertTextFieldContents(titleTextField:"\(titleTextField)",notesTextField:"\(notesTextField))
            self.tableViewOutlet.reloadData()
        }))
        
        // 4. Present the alert.
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(alertTextFieldContentsInViewController)
        let nextViewController = segue.destinationViewController as! secondViewController
        var indexPath = tableViewOutlet.indexPathForSelectedRow!
        print(indexPath.row)
        
        nextViewController.alertTextFieldContentsInSecondViewController = alertTextFieldContentsInViewController
        
    }





}