//
//  secondViewController.swift
//  SuperNote
//
//  Created by student1 on 1/15/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
   // var titleTextFieldSecondViewController = ""
   // var notesTextFieldSecondViewController = ""
    //var alertTextFieldDictionarySecondViewController: Dictionary<String, String> = ["":""]
    var alertTextFieldContentsInSecondViewController = alertTextFieldContents()
    
    
    @IBOutlet weak var titlelabel: UILabel!

    @IBOutlet weak var notesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("This is from the secondViewController!! Title TextField: \(alertTextFieldContentsInSecondViewController.titleTextField)")
        print("This is from the secondViewController!! Notes TextField: \(alertTextFieldContentsInSecondViewController.notesTextField)")
        titlelabel.text = "\(alertTextFieldContentsInSecondViewController.titleTextField)"
        notesLabel.text = "\(alertTextFieldContentsInSecondViewController.notesTextField)"
        
        
        // Do any additional setup after loading the view.
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
