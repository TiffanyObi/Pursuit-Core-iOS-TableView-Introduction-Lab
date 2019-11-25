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
        statusOfTasks = [Task.allTasks]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
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
        return "Task Status : "
    }
}
