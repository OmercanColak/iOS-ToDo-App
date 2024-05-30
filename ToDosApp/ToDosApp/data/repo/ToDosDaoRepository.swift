//
//  ToDosDaoRepository.swift
//  ToDosApp
//
//  Created by Ömercan Çolak on 26.05.2024.
//

import Foundation
import RxSwift

class ToDosDaoRepository {
    var toDosList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    func save(name:String){
        print("ToDo Save : \(name)")
    }
    
    func update(id:Int,name:String){
       print("ToDo Update : \(id) - \(name)")
    }
    
    func delete(id:Int){
        print("ToDo Delete : \(id)")
    }
    
    func search(searchText: String){
        print("ToDo Search: \(searchText)")
    }
    
    func loadToDos(){
        var list = [ToDos]()
        let toDo1 = ToDos(id: 1, name: "Spor")
        let toDo2 = ToDos(id: 2, name: "Ödev")
        let toDo3 = ToDos(id: 3, name: "Alışveriş")
        list.append(toDo1)
        list.append(toDo2)
        list.append(toDo3)
        
        toDosList.onNext(list) //Trigger - Tetikleme
    }
}
