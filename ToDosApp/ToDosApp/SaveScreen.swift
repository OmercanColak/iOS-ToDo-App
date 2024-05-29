//
//  SaveScreen.swift
//  ToDosApp
//
//  Created by Kasım on 25.05.2024.
//

import UIKit

class SaveScreen: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Save Screen"
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if let name = textFieldName.text {//Optional binding ( if let )
            save(name: name)
        }
    }
    
    func save(name:String){
        print("ToDo Save : \(name)")
    }
}
