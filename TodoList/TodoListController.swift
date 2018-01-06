//
//  TodoListController.swift
//  TodoList
//
//  Created by Sahil Gangele on 1/4/18.
//  Copyright © 2018 Sahil Gangele. All rights reserved.
//

import UIKit
import CoreData

class TodoListController: UITableViewController {

   
    // The context communicates which the fetched resutls controller when changes occur, which allows the controller to inform the delegate
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    lazy var dataSource: DataSource = {
        return DataSource(tableView: self.tableView, managedObjectContext: self.managedObjectContext)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    // MARK: Navigation
    // We use dependency injection for passing managedObjectContext to AddTaskController
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItem" {
            let navController = segue.destination as! UINavigationController
            let addTaskController = navController.topViewController as! AddTaskController
            addTaskController.managedObjectContext = self.managedObjectContext
        } else if segue.identifier == "showDetail" {
            guard let detailController = segue.destination as? DetailViewController, let indexPath = self.tableView.indexPathForSelectedRow else { return }
            let item = self.dataSource.object(at: indexPath)
            detailController.item = item
            detailController.managedObjectContext = self.managedObjectContext
            
        }
        
    }

}
