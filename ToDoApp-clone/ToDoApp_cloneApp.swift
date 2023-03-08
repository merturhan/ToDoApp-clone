//
//  ToDoApp_cloneApp.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 3.03.2023.
//

import SwiftUI

@main
struct ToDoApp_cloneApp: App {
    
    @StateObject var myCategories = CategoryViewModel()
    @StateObject var myTaskView = TaskViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            ViewDecider(myCategories: myCategories, myTasks: myTaskView)
        }
    }
}

