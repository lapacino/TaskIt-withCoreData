//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by lapacino on 8/13/15.
//  Copyright (c) 2015 lapacino. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var mainVC:ViewController!
    var taskModelDetail:TaskModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taskTextField.text = taskModelDetail.task
        subTaskTextField.text = taskModelDetail.subTask
        dueDatePicker.date = taskModelDetail.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelBarButton(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneBarButton(sender: UIBarButtonItem) {
        
        var appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context = appDelegate.managedObjectContext
        taskModelDetail.task = taskTextField.text
        taskModelDetail.subTask = subTaskTextField.text
        taskModelDetail.date = dueDatePicker.date
        taskModelDetail.completed = taskModelDetail.completed
        context?.save(nil)
       
        
     
        
        
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }


}
