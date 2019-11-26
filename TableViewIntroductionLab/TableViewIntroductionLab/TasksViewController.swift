//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var changedTaskButton: UIButton!
    
    /*  var newTasks = [Task]() {
        didSet {
            tableView.reloadData()
        }
    }
     */
    var statusOfTasks = [[Task]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
   
    
    func loadData() {
        statusOfTasks = Task.orderTasks()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
     var descending = false
    
    func sortEachTask() {
        
        var sortedGroup = [[Task]]()
        
        
            
            if descending == true {
                for group in statusOfTasks {
                    
          let newGroup =  group.sorted { $0.dueDate > $1.dueDate }
                
            sortedGroup.append(newGroup)
                
                statusOfTasks = sortedGroup
                    
                }
                sortedGroup = [[Task]]()
                
            } else if descending == false {
                
                for group in statusOfTasks {
                
                let newGroup = group.sorted { $0.dueDate < $1.dueDate}
                
                sortedGroup.append(newGroup)
                
                statusOfTasks = sortedGroup
                
            }
            sortedGroup = [[Task]]()
        }
    }
    
    @IBAction func changeTaskOrder(_ sender: UIButton) {
        
       // var sortedTask = statusOfTasks
        
        if sender.titleLabel?.text == "Sort Ascending" {
            descending.toggle()
            sortEachTask()
            sender.setTitle("Sort Descending", for: .normal)

    } else {
            descending.toggle()
            sortEachTask()
           sender.setTitle("Sort Ascending", for: .normal)
                    }
        
        
           
    }
        
        
}
        
                



extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        statusOfTasks[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskCell = tableView.dequeueReusableCell(withIdentifier: "eachTaskCell", for: indexPath)
        
        let taskForRow = statusOfTasks[indexPath.section][indexPath.row]
        
        taskCell.textLabel?.text = taskForRow.name
        
        taskCell.detailTextLabel?.text = taskForRow.dueDate.description(with: .current)
        
        return taskCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return statusOfTasks.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
               
        return statusOfTasks[section].first?.status.rawValue
}
    

}
