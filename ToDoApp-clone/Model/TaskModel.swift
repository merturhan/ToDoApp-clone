//
//  TaskModel.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 5.03.2023.
//

import Foundation

struct TaskModel : Identifiable {
    
    var id = UUID()
    var textFieldText : String
    var date : Date
    var note : String
    var isTaskDone = false
    
    mutating func changeStatus(){
        isTaskDone.toggle()
    }
    
}



