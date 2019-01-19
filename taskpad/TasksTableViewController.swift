//
//  TasksTableViewController.swift
//  taskpad
//
//  Created by Yichen Cao on 2019-01-18.
//  Copyright © 2019 UBC Launch Pad. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: As a user, I want the title of the screen to say "Tasks" instead of "Root View Controller"

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showCreateTask(sender:)))
        self.navigationItem.leftBarButtonItem = addButtonItem
        
        // TODO: As a developer, I want there to be several pre-generated tasks when the app loads for testing purposes.
    }

    
    // MARK: - Table view data source OscarQQ

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row].title
        
        // TODO: As a user, I want to see images (that I have associated with a task) to be visible in that row.

        return cell
    }
    
    // MARK: - Insertion and Deletion

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // TODO: As a user I would prefer if the app didn't crash here when I try to delete a task.
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // TODO: There is a bug here. When we rearrange the table view, the contents of `tasks` do not change. Create a few tasks, and try scrolling up (drag finger from bottom to top) and letting go. Notice how the tasks go back to the order they were before the rearranging. Fix this here!
    }
    
    @objc func showCreateTask(sender: UIBarButtonItem) {
        let taskInputAlert = UIAlertController(title: "Create a New Task", message: nil, preferredStyle: .alert)
        taskInputAlert.addTextField { (textField) in
            textField.placeholder = "Task Title"
        }
        let confirmAction = UIAlertAction(title: "Create Task", style: .default, handler: { (action) in
            guard let title = taskInputAlert.textFields?.first?.text, let image = UIImage(named: "LaunchPadLogo"), title != "" else {
                // TODO: As a developer, I would like to log an error when the user cannot create a task (due to an empty title, for example)
                return
            }
            let newTask = Task(title: title, image: image)
            self.tasks.insert(newTask, at: 0)
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        })
        taskInputAlert.addAction(confirmAction)
        // TODO: As a user, I would like to cancel adding a task when I don't wan't to add a task any more.
        present(taskInputAlert, animated: true, completion: nil)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let taskViewController = segue.destination as? TaskViewController {
            // TODO: As a user, I would like to see the task in the center of the screen after I click it.
            let _ = taskViewController // delete this line after implementation
        }
    }

}
