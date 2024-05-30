//
//  UpdateViewModel.swift
//  ToDosApp
//
//  Created by Ömercan Çolak on 26.05.2024.
//

import Foundation

class UpdateViewModel {
    var toDosRepo = ToDosDaoRepository()
    
    func update(toDo:ToDosModel,name:String){
        toDosRepo.update(toDo: toDo, name: name)
    }
}
