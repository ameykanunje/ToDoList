//
//  AddTasksController.swift
//  ToDoList
//
//  Created by Amey Kanunje on 9/27/24.
//

import UIKit

class TaskAddView {
    static func presentAddTaskAlert(on viewController: UIViewController, completion: @escaping (String, String) -> Void) {
        let alert = UIAlertController(title: "New Task", message: "Enter task details", preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Task Name"
        }
        
        alert.addTextField { field in
            field.placeholder = "Task Details"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm & Save", style: .default, handler: { _ in
            guard let fields = alert.textFields, fields.count == 2 else { return }
            
            let nameField = fields[0]
            let detailsField = fields[1]
            
            guard let name = nameField.text, !name.isEmpty,
                  let details = detailsField.text, !details.isEmpty else {
                return
            }
            
            completion(name, details)
        }))
        
        viewController.present(alert, animated: true)
    }
}

