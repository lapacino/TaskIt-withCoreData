//
//  ViewController.swift
//  TaskIt
//
//  Created by lapacino on 8/13/15.
//  Copyright (c) 2015 lapacino. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    var fetchedResultController:NSFetchedResultsController = NSFetchedResultsController()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchedResultController = getFetchResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
        
        
       
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail" {
            var detailVC:TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            var indexPath = tableView.indexPathForSelectedRow()
            var thisTask = fetchedResultController.objectAtIndexPath(indexPath!) as! TaskModel
            detailVC.taskModelDetail = thisTask
            detailVC.mainVC = self
        }
        else {
            var addTaskVC:AddTaskViewController! = segue.destinationViewController as! AddTaskViewController
            addTaskVC.mainVC = self
        }
    }
    
    @IBAction func addButtonItem(sender: UIBarButtonItem) {
    }
    
    // Mark: TableView
    
    
          //UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  fetchedResultController.sections!.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultController.sections![section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var thisTask:TaskModel = fetchedResultController.objectAtIndexPath(indexPath) as! TaskModel
        var cell:TaskCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TaskCell
        cell.taskLabel.text = thisTask.task
        cell.subTaskLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        return cell
    }
    
          //UITableViewDelegate
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "To Do"
        }
        else{
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let thisTask:TaskModel = fetchedResultController.objectAtIndexPath(indexPath) as! TaskModel
        
        if indexPath.section == 0  {
          thisTask.completed = true
        }
        else {
            thisTask.completed = false
                    }
       (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        
        tableView.reloadData()
    }
    
    func taskWithRequest() -> NSFetchRequest {
        
        let taskRequest = NSFetchRequest(entityName: "TaskModel")
        var dateDiscriptor = NSSortDescriptor(key: "date", ascending: true)
        var completedDiscriptor = NSSortDescriptor(key: "completed", ascending: true)
        taskRequest.sortDescriptors = [dateDiscriptor, completedDiscriptor]
        
        return taskRequest
    }
    
    func getFetchResultController() -> NSFetchedResultsController {
        
        self.fetchedResultController = NSFetchedResultsController(fetchRequest: taskWithRequest(), managedObjectContext: context, sectionNameKeyPath: "completed", cacheName: nil)
        
        return fetchedResultController
    }
    
    
    

}

