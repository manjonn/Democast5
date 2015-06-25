//
//  ToDo.swift
//  DemoCast3
//
//  Created by Manjula Jonnalagadda on 4/13/15.
//  Copyright (c) 2015 Manjula Jonnalagadda. All rights reserved.
//

import Foundation

class ToDo {
    
    var toDoItem:String=""
    var date:NSDate = NSDate()
    var auther:String=""
    
    init(){
        
    }
    init(toDoItem pToDoItem:String, date pDate:NSDate, auther pAuther:String){
        toDoItem=pToDoItem
        date=pDate
        auther=pAuther
    }
    
}
