//
//  EmptyStateView.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 3.03.2023.
//

import SwiftUI

struct EmptyStateView: View {
    
    
    @ObservedObject var myCategories : CategoryViewModel
    @ObservedObject var myTasks : TaskViewModel
    
    @Binding var isEmptyStateViewOn : Bool
    @Binding var isToDoListViewOn : Bool
    
    @State var isNewTaskViewOn : Bool = false
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                BackgroundView()
                
                VStack{
                    Spacer()
                    HStack{
                            Spacer()
                        Button{
                            //Go to NewTaskView()
                            self.isNewTaskViewOn.toggle()
                        } label: {
                            ZStack{
                                Circle()
                                    .frame(width: 60, height: 60, alignment: .center)
                                    .foregroundColor(.indigo)
                                    
                                Text("+")
                                    .foregroundColor(.white)
                                    .frame(alignment: .center)
                                    .font(.title)
                            }.shadow(radius: 25)
                            
                        }.fullScreenCover(isPresented: $isNewTaskViewOn){
                            NewTaskView(isNewTaskView: $isNewTaskViewOn, myCategories: myCategories, myTasks: myTasks)
                        }
                        
                         
                                

                    }
                }.padding()
            }
            .navigationTitle("ToDo")
        }
        
    }
}

//struct EmptyStateView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmptyStateView(myCategories: CategoryViewModel(), myTasks: TaskViewModel())
//    }
//}

