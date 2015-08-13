//
//  TaskModel.swift
//  TaskIt
//
//  Created by lapacino on 8/13/15.
//  Copyright (c) 2015 lapacino. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var task: String
    @NSManaged var subTask: String
    @NSManaged var date: NSDate
    @NSManaged var completed: NSNumber

}
