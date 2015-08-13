//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by lapacino on 8/13/15.
//  Copyright (c) 2015 lapacino. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var mainVC:ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButton(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func addTaskButton(sender: UIButton) {
        
        var appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context = appDelegate.managedObjectContext
        var entity = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: context!)
        var thisTask = TaskModel(entity: entity!, insertIntoManagedObjectContext: context!)
        thisTask.task = taskTextField.text
        thisTask.subTask = subTaskTextField.text
        thisTask.date = dueDatePicker.date
        thisTask.completed = false 
        context?.save(nil)
        
        var request = NSFetchRequest(entityName: "TaskModel")
        var error:NSError? = nil
        var results = context?.executeFetchRequest(request, error: &error)
        
        
        
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
