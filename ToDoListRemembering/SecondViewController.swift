//
//  SecondViewController.swift
//  ToDoListRemembering
//
//  Created by Ahmed T Khalil on 12/28/16.
//  Copyright © 2016 kalikans. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var newTask: UITextField!
    @IBAction func addNewTask(_ sender: Any) {
        
        let itemsObj = UserDefaults.standard.object(forKey: "itemsRemembering")
        
        var items : [String]
        
        if let tempItems = itemsObj as? [String]{
            items = tempItems
            items.append(newTask.text!)
        }else{
            items = [newTask.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "itemsRemembering")
        
        newTask.text=""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Keyboard Stuff
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addNewTask(Any.self)
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}

