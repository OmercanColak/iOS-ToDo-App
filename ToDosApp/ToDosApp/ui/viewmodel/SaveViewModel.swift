//
//  SaveViewModel.swift
//  ToDosApp
//
//  Created by Ömercan Çolak on 26.05.2024.
//

import Foundation

class SaveViewModel {
    var toDosRepo = ToDosDaoRepository()
    
    func save(name:String){
        toDosRepo.save(name: name)
    }
}
