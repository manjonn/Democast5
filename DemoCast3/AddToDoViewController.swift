//
//  AddToDoViewController.swift
//  DemoCast3
//
//  Created by Manjula Jonnalagadda on 4/13/15.
//  Copyright (c) 2015 Manjula Jonnalagadda. All rights reserved.
//

import UIKit

protocol AddToDoViewControllerDelegate{
    
    func addToDo(toDo:ToDo)
    
}

class AddToDoViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var toDoItemTextField: UITextField!
    @IBOutlet weak var dateButton: UIButton!
    
    @IBOutlet weak var dateToolbar: UIToolbar!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let dateFormatter:NSDateFormatter=NSDateFormatter()
    
    var delegate:AddToDoViewControllerDelegate?
    
    @IBAction func showDate(sender: UIButton) {
        
        datePicker.hidden=false
        dateToolbar.hidden=false
        
    }
    
    @IBAction func save(sender: UIButton) {
        
        let toDo:ToDo=ToDo()
        toDo.toDoItem=toDoItemTextField.text!
        toDo.date=datePicker.date
        
        delegate?.addToDo(toDo)
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func cancelDatePicking(sender: UIBarButtonItem) {
        
        datePicker.hidden=true
        dateToolbar.hidden=true
        

    }
    
    @IBAction func doneDatePicking(sender: UIBarButtonItem) {
        
        datePicker.hidden=true
        dateToolbar.hidden=true
        dateButton.setTitle(dateFormatter.stringFromDate(datePicker.date), forState: UIControlState.Normal)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat="dd-MMM-yyyy hh:mm a"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
