//
//  Date.swift
//  TaskIt
//
//  Created by lapacino on 8/13/15.
//  Copyright (c) 2015 lapacino. All rights reserved.
//

import Foundation

class Date {
    
    class func from(#year:Int, month:Int, day:Int) -> NSDate {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        var date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
    }
    
    class func toString(#date:NSDate) -> String {
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/M/yyyy"
        var dateToString = dateFormatter.stringFromDate(date)
        
        return dateToString
    }
}