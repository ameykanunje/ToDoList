////
////  AddTaskViewController.swift
////  ToDoList
////
////  Created by Amey Kanunje on 9/27/24.
////
//
//import UIKit
//
//class AddTaskViewController: UIViewController {
//    private let viewModel: TasksViewModel
//    private let nameTextField = UITextField()
//    private let detailsTextField = UITextField()
//    private let addButton = UIButton()
//
//    init(viewModel: TasksViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//    }
//
//    private func setupView() {
//        view.backgroundColor = .white
//        title = "Add Task"
//
//        nameTextField.placeholder = "Task Name"
//        detailsTextField.placeholder = "Task Details"
//        
//        addButton.setTitle("Add Task", for: .normal)
//        addButton.backgroundColor = .blue
//        addButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)
//
//        // Add UI components to the view and set up constraints
//    }
//
//    @objc private func addTask() {
//        guard let name = nameTextField.text, let details = detailsTextField.text else { return }
//        viewModel.addTask(name: name, details: details)
//        navigationController?.popViewController(animated: true)
//    }
//}
