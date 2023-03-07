//
//  Controller.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 4.03.2023.
//

import Foundation

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
    
    func increaseAll(){
        for i in 0...13 {
            categories[i].counter += 1
            //print(categories[i].counter)
        }
    }
    
}
