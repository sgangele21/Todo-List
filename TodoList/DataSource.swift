//
//  DataSource.swift
//  TodoList
//
//  Created by Sahil Gangele on 1/5/18.
//  Copyright © 2018 Sahil Gangele. All rights reserved.
//

import UIKit
import CoreData

public class DataSource: NSObject, UITableViewDataSource {
    
    private let tableView: UITableView
    
    lazy var fetchedResultsController: TodoFetchedResultsController = {
        return TodoFetchedResultsController(managedObjectContext: self.managedObjectContext, tableView: self.tableView)
    }()
    
    var managedObjectContext: NSManagedObjectContext
    
    public init(tableView: UITableView, managedObjectContext: NSManagedObjectContext) {
        self.tableView = tableView
        self.managedObjectContext = managedObjectContext
    }
    
    func object(at indexPath: IndexPath) -> Item {
        return fetchedResultsController.object(at: indexPath)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = self.fetchedResultsController.sections?[section] else { return 0 }
        return section.numberOfObjects
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        return self.configureCell(cell, at: indexPath)
    }
    
    
    private func configureCell( _ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        let item = self.fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = item.text
        return cell
        
    }
    
    // Asks the data source if they want to commit the insertion or deletion of a cell
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = fetchedResultsController.object(at: indexPath)
        managedObjectContext.delete(item)
        managedObjectContext.saveChanges()
    }
    
    
}
