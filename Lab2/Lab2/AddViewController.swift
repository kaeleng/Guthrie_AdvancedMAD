//
//  AddViewController.swift
//  Lab2
//
//  Created by Kaelen Guthrie on 2/17/18.
//  Copyright © 2018 Kaelen Guthrie. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    var newAssignment = String()
       
    @IBOutlet weak var addAssignment: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "doneSegue"{
            if((addAssignment.text?.isEmpty) == false){
                newAssignment = addAssignment.text!
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
