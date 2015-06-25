//
//  ViewController.swift
//  DemoCast3
//
//  Created by Manjula Jonnalagadda on 3/21/15.
//  Copyright (c) 2015 Manjula Jonnalagadda. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,AddToDoViewControllerDelegate {
    
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    var items:[ToDo]=[]
    let cellIdentifier="cell"
    let dateFormatter:NSDateFormatter=NSDateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat="dd-MMM-yyyy hh:mm a"

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let addToDoViewController:AddToDoViewController=segue.destinationViewController as! AddToDoViewController
        addToDoViewController.delegate=self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell?=tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell?
        if cell==nil{
            cell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        }
        let toDo:ToDo=items[indexPath.row]
        cell?.textLabel?.text=toDo.toDoItem
        cell?.detailTextLabel?.text=dateFormatter.stringFromDate(toDo.date)
        return cell!
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle==UITableViewCellEditingStyle.Delete{
            items.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func addToDo(toDo: ToDo) {
        items.append(toDo)
        toDoTableView.reloadData()
    }


}

