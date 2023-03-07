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
    
    var body: some Scene {
        
        WindowGroup {
            ToDoList(myCategories: myCategories)
        }
    }
}
//
//private func decider (myCategories : CategoryViewModel ) -> some View
//{
//
//    var allCounter = 0
//
//    for i in 0...13{
//        allCounter += myCategories.categories[i].counter
//    }
//
//    if(allCounter > 0){
//        return ToDoList(myCategories: myCategories)
//    }
//
//    return EmptyStateView()
//
//}
