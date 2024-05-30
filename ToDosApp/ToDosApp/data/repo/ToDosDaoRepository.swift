//
//  ToDosDaoRepository.swift
//  ToDosApp
//
//  Created by Ömercan Çolak on 26.05.2024.
//

import Foundation
import RxSwift

class ToDosDaoRepository {
    var toDosList = BehaviorSubject<[ToDosModel]>(value: [ToDosModel]())
    
    //Veri tabanından alınan yetki
    let context = appDelegate.persistentContainer.viewContext
    
    func save(name:String){
       let toDo = ToDosModel(context: context)
        toDo.name = name
        
        appDelegate.saveContext()
    }
    
    func update(toDo:ToDosModel,name:String){
        toDo.name = name
        appDelegate.saveContext()
    }
    
    func delete(toDo:ToDosModel){
        context.delete(toDo)
        appDelegate.saveContext()
    }
    
    func search(searchText: String){
        do{
            let fr = ToDosModel.fetchRequest()
            fr.predicate = NSPredicate(format: "name CONTAINS[c] %@", searchText)
            let list = try context.fetch(fr) //tabloyu okuma işlemi
            toDosList.onNext(list) //Trigger - Tetikleme
        }catch {
            print(error.localizedDescription)
        }
    }
    
    func loadToDos(){

        do{
            let fr = ToDosModel.fetchRequest()
            let list = try context.fetch(fr) //tabloyu okuma işlemi
            toDosList.onNext(list) //Trigger - Tetikleme
        }catch {
            print(error.localizedDescription)
        }
    }
}

