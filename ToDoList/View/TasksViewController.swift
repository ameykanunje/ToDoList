//
//  TasksViewController.swift
//  ToDoList
//
//  Created by Amey Kanunje on 9/27/24.
//

import UIKit

class TasksViewController: UIViewController{
    var tableView = UITableView()
    var viewModel = TasksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set up View
        setupUI()
        
        //fetch initial tasks
        viewModel.getAllTask()
        
        tableView.reloadData()
    }
    
    private func setupUI() {
        title = "To-Do List"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        
        
        // TableView constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func didTapAdd() {
        TaskAdder.presentAddTaskAlert(on: self) { [weak self] name, details in
            // Add the task using ViewModel
            self?.viewModel.createTask(name: name, details: details)

            // Reload the tableView after adding a task
            self?.viewModel.getAllTask()  // Fetch the updated list
            self?.tableView.reloadData()
        }
    }
    
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension TasksViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Number of rows in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.tasks.count)
        return viewModel.tasks.count
    }
    
    // Configure cell to display task name and details
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        let task = viewModel.tasks[indexPath.row]
        cell.configure(task: task)
        cell.checkbox.addTarget(self, action: #selector(didTapCheckbox(_:)), for: .touchUpInside)
        cell.checkbox.tag = indexPath.row
        return cell
    }
    
    @objc private func didTapCheckbox(_ sender: UIButton) {
            let task = viewModel.tasks[sender.tag]
            viewModel.toggleTaskCompletion(task: task)
            tableView.reloadData()
    }
    
    // Optionally, handle cell selection if you need
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Perform any action on task selection if needed
    }
}
