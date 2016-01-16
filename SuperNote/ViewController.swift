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
    
    var notesInTableViewArray = ["Tom", "Jim","Bob","Justin", "Sally"]
    var alertTextFieldDictionary: Dictionary<String, String> = ["titleTextFieldKey":"","notesTextFieldKey":""]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = notesInTableViewArray[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesInTableViewArray.count;
    }
    
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
            let notesTextField = alert.textFields![0] as UITextField
            //Placing the contents of the two textfields into a dictionary so that they can be passed to the next viewcontroller.
            self.alertTextFieldDictionary["titleTextFieldKey"] = titleTextField.text
            self.alertTextFieldDictionary["notesTextFieldKey"] = notesTextField.text
            //Printing the contents into the console so that you can see if they are recieving the text from the UITextField.
            print(" Title Text field: \(titleTextField.text)")
            print("Notes Text field: \(notesTextField.text)")
            self.notesInTableViewArray.append(titleTextField.text!)
            self.tableViewOutlet.reloadData()
        }))
        
        // 4. Present the alert.
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextViewController = segue.destinationViewController as! secondViewController
        nextViewController.alertTextFieldDictionarySecondViewController = alertTextFieldDictionary
        
    }





}