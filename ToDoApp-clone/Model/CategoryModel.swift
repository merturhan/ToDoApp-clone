//
//  CategoryModel.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 4.03.2023.
//

import Foundation

struct CategoryModel : Identifiable{
    
    var id = UUID()
    var categoryName : String
    var categoryPicName : String
    var counter : Int = 0
    var tasks : [TaskModel]?
    
    mutating func addTaskToCategory( task : TaskModel){
        tasks?.append(task)
    }
    
}
