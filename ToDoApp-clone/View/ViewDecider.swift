//
//  ViewDecider.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 8.03.2023.
//

import SwiftUI

struct ViewDecider: View {
    
    @ObservedObject var myCategories : CategoryViewModel
    @ObservedObject var myTasks : TaskViewModel
    
    @State var isEmptyStateViewOn : Bool = false
    @State var isToDoListViewOn : Bool = false
    
    var body: some View {
        
        if(myCategories.isEmptyStateView(myCategories: myCategories)){
            EmptyStateView(myCategories: myCategories, myTasks: myTasks, isEmptyStateViewOn: $isEmptyStateViewOn, isToDoListViewOn: $isToDoListViewOn)
        }
        else{
            ToDoList(myCategories: myCategories, myTasks: myTasks, isToDoListViewOn: $isToDoListViewOn, isEmptyStateView: $isEmptyStateViewOn)
        }
                
            
            
        
        
        
        
    }
    
    struct ViewDecider_Previews: PreviewProvider {
        static var previews: some View {
            ViewDecider(myCategories: CategoryViewModel(), myTasks: TaskViewModel())
        }
    }
}
