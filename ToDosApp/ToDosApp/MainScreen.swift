//
//  ViewController.swift
//  ToDosApp
//
//  Created by Kasım on 25.05.2024.
//

import UIKit

class MainScreen: UIViewController{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDosTableView: UITableView!
    var toDosList = [ToDos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ToDos"
        setupTheme()
        
        searchBar.delegate = self
        toDosTableView.delegate = self
        toDosTableView.dataSource = self
        
        loadToDos()
        
        
    }
    
    func loadToDos(){
        let toDo1 = ToDos(id: 1, name: "Spor")
        let toDo2 = ToDos(id: 2, name: "Ödev")
        let toDo3 = ToDos(id: 3, name: "Alışveriş")
        toDosList.append(toDo1)
        toDosList.append(toDo2)
        toDosList.append(toDo3)
    }
    
    func setupTheme(){
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor(named: "MainColor")
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(named: "AlternativeColor1")!,
            .font: UIFont(name: "Pacifico-Regular", size: 22)!]
        
        navigationController?.navigationBar.tintColor = UIColor(named: "AlternativeColor1")
        //Navigation Controller üzerindeki geri dönüş ve icon renkleri
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare çalıştı")
        if segue.identifier == "toUpdate" {
            print("toUpdate çalıştı")
            if let toDo = sender as? ToDos {//Downcasting(Superclass > Subclass)
                let destinationVC = segue.destination as! UpdateScreen
                destinationVC.toDo = toDo
            }
        }
    }
    
}


extension MainScreen : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("ToDo Search : \(searchText)")
    }
}

extension MainScreen : UITableViewDelegate, UITableViewDataSource, CellProtocol {
    
    func buttonDeleteClicked(indexPath: IndexPath) {
        let toDo = self.toDosList[indexPath.row]
        
        
        let alert = UIAlertController(title: "Delete Process", message: "Are you sure do you want to delete  \(toDo.name!) ? ", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
            print("ToDo Delete : \(toDo.id!)")
        }
        alert.addAction(yesAction)
        
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoCell
        
        let toDo = toDosList[indexPath.row]
        
        cell.labelName.text = toDo.name
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDosList[indexPath.row]
        performSegue(withIdentifier: "toUpdate", sender: toDo)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Kaydırarak silme işlemi
    //Right-> trailing , left -> leading
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            contextualAction,view,bool in
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
