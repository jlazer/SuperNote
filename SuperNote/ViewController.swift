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
    //@IBOutlet weak var superNoteNameLabel: UILabel!
    //Creating an array of the custom class alertTextFieldContents
    var notesInTableViewArray = [alertTextFieldContents]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Configuring The TableView.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = notesInTableViewArray[indexPath.row].titleTextField
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesInTableViewArray.count
    }
    //Add Note Button
    @IBAction func addNewValue(_ sender: UIButton) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Create A Note", message: "Please fill the parameters", preferredStyle: .alert)
        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: { (titleTextField) -> Void in
            titleTextField.text = "Title."
        })
        alert.addTextField(configurationHandler: { (notesTextField) -> Void in
            notesTextField.text = "Notes."
        })
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            let titleTextField = alert.textFields![0] as UITextField
            let notesTextField = alert.textFields![1] as UITextField
            //Placing the contents of the two textfields into the a buffer.
            
            let currentContent = alertTextFieldContents()
            currentContent.titleTextField = titleTextField.text!
            currentContent.notesTextField = notesTextField.text!
            self.notesInTableViewArray.append(currentContent)
            self.tableViewOutlet.reloadData()
            //Printing the contents into the console so that you can see if they are recieving the text from the UITextField.
            print(" Title Text field: \(currentContent.titleTextField)")
            print("Notes Text field: \(currentContent.notesTextField)")
        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func superNoteInfoButton(_ sender: UIButton) {
        let startupAlert = UIAlertController(title: "Instructions", message: "Please tap the + to create a new note", preferredStyle: .alert)
        self .present(startupAlert, animated: true, completion: nil)
        self.present(startupAlert, animated: true, completion: nil)
        startupAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
        }))
    }
    
    //creating a tap gesture recognizer to display an alert.
    //@IBAction func whenTapped(sender: UITapGestureRecognizer) {
      //  let selectedPoint = sender.locationInView(self.view)
        //print(selectedPoint)
        //if CGRectContainsPoint(superNoteNameLabel.frame, selectedPoint)
        //{
            //creating the startup alert.
            //let startupAlert = UIAlertController(title: "Instructions", message: "Please tap the + to create a new note", preferredStyle: .Alert)
            //self .presentViewController(startupAlert, animated: true, completion: nil)
   // }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print(alertTextFieldContentsInViewController)
        let nextViewController = segue.destination as! secondViewController
        let indexPath = tableViewOutlet.indexPathForSelectedRow!
        let selectedTableCell = notesInTableViewArray[indexPath.row]
        nextViewController.alertTextFieldContentsInSecondViewController = selectedTableCell
    }
}
