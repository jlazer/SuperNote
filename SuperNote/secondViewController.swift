//
//  secondViewController.swift
//  SuperNote
//
//  Created by student1 on 1/15/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
  //Creating an instance of alertTextFieldContents Class.
    var alertTextFieldContentsInSecondViewController = alertTextFieldContents()
    
    
    @IBOutlet weak var titlelabel: UILabel!

    @IBOutlet weak var notesLabel: UILabel!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var titleTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("This is from the secondViewController!! Title TextField: \(alertTextFieldContentsInSecondViewController.titleTextField)")
        print("This is from the secondViewController!! Notes TextField: \(alertTextFieldContentsInSecondViewController.notesTextField)")
//        titlelabel.text = "\(alertTextFieldContentsInSecondViewController.titleTextField)"
//        notesLabel.text = "\(alertTextFieldContentsInSecondViewController.notesTextField)"
        titleTextView.text = "\(alertTextFieldContentsInSecondViewController.titleTextField)"
        notesTextView.text = "\(alertTextFieldContentsInSecondViewController.notesTextField)"
        
        
        //alertTextFieldContentsInSecondViewController.notesTextField = notesTextView.text
        // Do any additional setup after loading the view.
    }

    @IBAction func updateNotesWithContentsOfTextView(_ sender: UIButton) {
        //Allowing users to edit the contents of their notes.
        alertTextFieldContentsInSecondViewController.notesTextField = notesTextView.text
        alertTextFieldContentsInSecondViewController.titleTextField = titleTextView.text
        //notesTextView.text = alertTextFieldContentsInSecondViewController.notesTextField
        titleTextView.text = "\(alertTextFieldContentsInSecondViewController.titleTextField)"
        notesTextView.text = "\(alertTextFieldContentsInSecondViewController.notesTextField)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController
        //wnvc.notesInTableViewArray = alertTextFieldContentsInSecondViewController
        
    }
}
