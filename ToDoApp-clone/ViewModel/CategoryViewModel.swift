//
//  Controller.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 4.03.2023.
//

import Foundation
import SwiftUI

class CategoryViewModel :  ObservableObject{
    
    @Published var categories : [CategoryModel] = [
        CategoryModel(categoryName: "All", categoryPicName: "task_all"),
        CategoryModel(categoryName: "Cooking", categoryPicName: "task_cooking"),
        CategoryModel(categoryName: "Finance", categoryPicName: "task_finance"),
        CategoryModel(categoryName: "Gift", categoryPicName: "task_gift"),
        CategoryModel(categoryName: "Health", categoryPicName: "task_health"),
        CategoryModel(categoryName: "Home", categoryPicName: "task_home"),
        CategoryModel(categoryName: "Ideas", categoryPicName: "task_ideas"),
        CategoryModel(categoryName: "Music", categoryPicName: "task_music"),
        CategoryModel(categoryName: "Others", categoryPicName: "task_others"),
        CategoryModel(categoryName: "Payment", categoryPicName: "task_payment"),
        CategoryModel(categoryName: "Shopping", categoryPicName: "task_shopping"),
        CategoryModel(categoryName: "Study", categoryPicName: "task_study"),
        CategoryModel(categoryName: "Travel", categoryPicName: "task_travel"),
        CategoryModel(categoryName: "Work", categoryPicName: "task_work")]
    
    
    init(){
                        
    }
    
    func addTaskToSelectedCategory(selectedCategoryIndex : Int, taskToAdd : TaskModel, categoryName : String){
        
        if(categoryName == "All"){
            self.categories[selectedCategoryIndex].tasks.append(taskToAdd)
            self.categories[selectedCategoryIndex].counter += 1
        }
        else{
            self.categories[0].tasks.append(taskToAdd)
            self.categories[0].counter += 1
            self.categories[selectedCategoryIndex].tasks.append(taskToAdd)
            self.categories[selectedCategoryIndex].counter += 1
        }
        
        
        
    }
    
    func increaseAll(){
        for i in 0...13 {
            categories[i].counter += 1
            //print(categories[i].counter)
        }
    }
    
    
    @ViewBuilder
    func decider (myCategories : CategoryViewModel , myTaskViewModel : TaskViewModel) -> some View
    {
        if(isToDoList(myCategories: myCategories)){
            ToDoList(myCategories: myCategories, myTasks: myTaskViewModel)
        }
        EmptyStateView(myCategories: myCategories, myTasks: myTaskViewModel)
    }
    
    func isToDoList(myCategories : CategoryViewModel) -> Bool{
        
        var allCounter = 0
        
        for i in 0...13{
            allCounter += myCategories.categories[i].counter
        }
        
        if(allCounter > 0){
            return true
        }
            
        return false
    }
    
    
    func getCategoryIndexByName(categoryName: String) -> (Int){
        
        switch categoryName {
        case "All":
            return 0
        case "Cooking":
            return 1
        case "Finance":
            return 2
        case "Gift":
            return 3
        case "Health":
            return 4
        case "Home":
            return 5
        case "Ideas":
            return 6
        case "Music":
            return 7
        case "Others":
            return 8
        case "Payment":
            return 9
        case "Shopping":
            return 10
        case "Study":
            return 11
        case "Travel":
            return 12
        case "Work":
            return 13
        default:
            print("Error")
        }
        
        return -1
    }
    
}
