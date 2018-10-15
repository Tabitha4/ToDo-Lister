//
//  CreateToDViewController.swift
//  ToDo Lister
//
//  Created by Tabitha Levine on 2018-09-18.
//  Copyright © 2018 Tabitha Levine. All rights reserved.
//

import UIKit

class CreateToDViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    var toDoTableVC : ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext {
            let newToDo = ToDo(context: context)
            newToDo.important = importantSwitch.isOn
            if let name = nameTextField.text {
                newToDo.name = name
            }
            (UIApplication.shared.delegate as?
                AppDelegate)?.saveContext()
        }
        
        navigationController?.popViewController(animated: true)
    }

}
