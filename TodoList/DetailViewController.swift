//
//  DetailViewController.swift
//  TodoList
//
//  Created by Sahil Gangele on 1/5/18.
//  Copyright © 2018 Sahil Gangele. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var item: Item?
    
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var detailTextField: UITextField!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let item = self.item {
            self.detailTextField.text = item.text
        }
    }
    
    
    @IBAction func save(_ sender: Any) {
        if let item = self.item, let newText = detailTextField.text {
            item.text = newText
            self.managedObjectContext.saveChanges()
            self.navigationController?.popViewController(animated: true)
            
        }
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        if let item = self.item {
            self.managedObjectContext.delete(item)
            self.managedObjectContext.saveChanges()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
