//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Amey Kanunje on 9/27/24.
//

import Foundation
import CoreData
import UIKit

class TasksViewModel {
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks = [ToDoListItem]()
    
    func getAllTask(){
        do {
            tasks = try context.fetch(ToDoListItem.fetchRequest())
        } catch {
            print("No Tasks Found: \(error.localizedDescription)")
        }
        
    }
    
    func createTask(name: String, details: String){
        let newTasks = ToDoListItem(context: context)
        newTasks.name = name
        newTasks.details = details
        newTasks.isCompleted = false
        
        //save the task
        do{
            try context.save()
            getAllTask()
        }catch{
            print("Error \(error.localizedDescription)")
        }
    }
    
    func toggleTaskCompletion(task: ToDoListItem){
        task.isCompleted.toggle()
        
        do {
            try context.save()
            getAllTask()
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
}
