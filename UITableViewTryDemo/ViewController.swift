//
//  ViewController.swift
//  UITableViewTryDemo
//
//  Created by Weihong Chen on 01/02/2015.
//  Copyright (c) 2015 Weihong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var uiTableView: UITableView!
    
    var content:[DataModel] = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiTableView.dataSource  = self
        self.uiTableView.delegate = self
        
        self.setData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
            content.removeAtIndex(indexPath.row)
            uiTableView.reloadData()
        }
        
        if editingStyle == UITableViewCellEditingStyle.Insert{
        
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        return UITableViewCellEditingStyle.Delete

    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let val = self.content.removeAtIndex(sourceIndexPath.row)
        
        // insert it into the new position
        self.content.insert(val, atIndex: destinationIndexPath.row)
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return content.count
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell: CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomTableViewCell
        
        cell.setCell(content[indexPath.row].getName(), age: content[indexPath.row].getAge())
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var detailsViewController: DetailsViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DetailsViewController") as! DetailsViewController
        
        detailsViewController.model = content[indexPath.row].getName()

        self.presentViewController(detailsViewController, animated: true, completion: nil)
        
    }
    
    
    func setData(){
    
        content.append(DataModel(name: "Weihong Chen 1", age: 1))
        content.append(DataModel(name: "Weihong Chen 2", age: 2))
        content.append(DataModel(name: "Weihong Chen 3", age: 3))
        content.append(DataModel(name: "Weihong Chen 4", age: 4))
        content.append(DataModel(name: "Weihong Chen 5", age: 5))

    }

}

