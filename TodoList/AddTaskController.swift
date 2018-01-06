//
//  AddTaskController.swift
//  TodoList
//
//  Created by Sahil Gangele on 1/4/18.
//  Copyright © 2018 Sahil Gangele. All rights reserved.
//

import UIKit
import CoreData

class AddTaskController: UIViewController {

    var managedObjectContext: NSManagedObjectContext!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        guard let text = self.textField.text, !text.isEmpty else { return }
        // Creates an instacne of item, inserts it into the manage object context, and returns the instance for us to use
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: self.managedObjectContext) as! Item
        item.text = text
        managedObjectContext.saveChanges()
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
