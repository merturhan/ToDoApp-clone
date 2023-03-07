//
//  TaskDetailView.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 7.03.2023.
//

import SwiftUI

struct TaskDetailView: View {
    
    @ObservedObject var myCategories : CategoryViewModel
    @ObservedObject var myTasks : TaskViewModel
    
    var body: some View {
        
        
        NavigationView{
            
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        Image("back")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Spacer()
                    }.padding(.bottom)
                    
                    HStack{
                        ZStack{
                            Circle().frame(width: 70, height: 70, alignment: .leading).colorInvert()
                            Image("task_all")
                        }
                        Spacer()
                    }
                    
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Category Name")
                                .font(.title3).bold()
                            Spacer()
                        }
                        HStack{
                            Text("3 Tasks")
                            Spacer()
                        }
                    }
                    
                    VStack{
                        
                        Spacer()
                        Rectangle().cornerRadius(40)
                            .frame(width: UIScreen.main.bounds.width)
                            .colorInvert()
                            .padding(.top, 40)
                        
                    }
                    
                    Spacer()
                }.padding()
            }
        }
        
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(myCategories: CategoryViewModel(), myTasks: TaskViewModel())
    }
}
