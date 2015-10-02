//
//  NewTaskViewController.swift
//  GritThingsDone
//
//  Created by  on 10/1/15.
//  Copyright (c) 2015 nisargapatel. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // take the blinking cursor outta there
        textField.resignFirstResponder()
        
        return true
    }
    

    @IBAction func doneAction(sender: UIButton) {
        
        if let nav = self.presentingViewController as? UINavigationController, listVC = nav.viewControllers.first as? TaskTableViewController {
            
            let newTask = Task(name: nameField.text!, dueDate: datePicker.date)
            
            listVC.tasks.append(newTask)
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
        
    }
    @IBAction func cancelAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
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
