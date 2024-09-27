//
//  TaskCell.swift
//  ToDoList
//
//  Created by Amey Kanunje on 9/27/24.
//

import UIKit

class TaskCell: UITableViewCell {
    
    let checkbox = UIButton()
    let taskLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        // Checkbox setup
        checkbox.setImage(UIImage(systemName: "circle"), for: .normal)
        checkbox.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        checkbox.addTarget(self, action: #selector(didTapCheckbox), for: .touchUpInside)
        contentView.addSubview(checkbox)
        
        // Task name setup
        taskLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        contentView.addSubview(taskLabel)
        
        // Task description setup
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)
        
        // Layout
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkbox.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            checkbox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkbox.widthAnchor.constraint(equalToConstant: 24),
            checkbox.heightAnchor.constraint(equalToConstant: 24),
            
            taskLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 10),
            taskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: taskLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: taskLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    @objc private func didTapCheckbox() {
        checkbox.isSelected.toggle() // Toggle the checkbox state
        // Notify that the checkbox state has changed
        // You can use delegation or closure for this, or leave it as is if handled in the ViewController
    }
    
    func configure(task: ToDoListItem) {
        taskLabel.text = task.name
        descriptionLabel.text = task.details
        checkbox.isSelected = task.isCompleted
    }
}
