//
//  CategoryViewViewModel.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 5.03.2023.
//

import Foundation

class TaskViewModel : ObservableObject{
    
    @Published var tasks : [TaskModel] = [
        
    ]
    
    
    func addTaskToCategory(myCategories : CategoryViewModel , newTask : TaskModel, selectedCategory : String){
        
        
        switch selectedCategory {
        case "All":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 0, taskToAdd: newTask, categoryName: selectedCategory)
        case "Cooking":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 1, taskToAdd: newTask, categoryName: selectedCategory)
        case "Finance":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 2, taskToAdd: newTask, categoryName: selectedCategory)
        case "Gift":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 3, taskToAdd: newTask, categoryName: selectedCategory)
        case "Health":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 4, taskToAdd: newTask, categoryName: selectedCategory)
        case "Home":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 5, taskToAdd: newTask, categoryName: selectedCategory)
        case "Ideas":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 6, taskToAdd: newTask, categoryName: selectedCategory)
        case "Music":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 7, taskToAdd: newTask, categoryName: selectedCategory)
        case "Others":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 8, taskToAdd: newTask, categoryName: selectedCategory)
        case "Payment":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 9, taskToAdd: newTask, categoryName: selectedCategory)
        case "Shopping":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 10, taskToAdd: newTask, categoryName: selectedCategory)
        case "Study":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 11, taskToAdd: newTask, categoryName: selectedCategory)
        case "Travel":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 12, taskToAdd: newTask, categoryName: selectedCategory)
        case "Work":
            myCategories.addTaskToSelectedCategory(selectedCategoryIndex: 13, taskToAdd: newTask, categoryName: selectedCategory)
        default:
            print("Error")
        }
    }
    
    
}


