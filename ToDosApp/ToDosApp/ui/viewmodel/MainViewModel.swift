//
//  MainViewModel.swift
//  ToDosApp
//
//  Created by Ömercan Çolak on 26.05.2024.
//

import Foundation
import RxSwift

class MainViewModel {
    
    var toDosRepo = ToDosDaoRepository()
    var toDosList = BehaviorSubject<[ToDos]>(value: [ToDos]())
    
    init(){ //Sınıftan nesne oluşturulduğunda Çalışır.
        toDosList = toDosRepo.toDosList // 
    }
    
    func delete(id:Int){
        toDosRepo.delete(id: id)
        loadToDos()
    }
   
    func search(searchText: String){
        toDosRepo.search(searchText: searchText)
    }
    
    func loadToDos(){
        toDosRepo.loadToDos()
    }
}
