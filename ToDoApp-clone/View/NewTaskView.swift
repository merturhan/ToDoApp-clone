//
//  NewTaskView.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 3.03.2023.
//

import SwiftUI

struct NewTaskView: View {
    
    @State var text : String = ""
    @State var taskDate = Date()
    @State var note : String = ""
    @State var selectedCategory : String = "Select category"
    
    @Binding var isNewTaskView : Bool

    @ObservedObject var myCategories : CategoryViewModel
    @ObservedObject var myTasks : TaskViewModel
    
    var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                VStack{
                    //2nd Title
                    HStack{
                        Text("What are your planning?")
                            .foregroundColor(.secondary)
                        Spacer()
                    }.padding(.leading)
                    
                    //TextEditor
                    TextEditor(text: $text)
                            .foregroundColor(.secondary)
                            .frame(width: UIScreen.main.bounds.width, height: 120, alignment: .top)
                            .padding(.bottom)
                    
                    Divider().padding(.bottom)
                    
                    //DatePicker
                    HStack{
                        Image(systemName: "bell.badge")
                            .foregroundColor(.secondary)
                            .padding(.leading)
                        DatePicker(selection: $taskDate, in: Date()...,
                                   displayedComponents: [.date, .hourAndMinute]){
                            // code
                            
                        }.padding(.trailing, 120)
                            .colorInvert().colorMultiply(.blue)
                    }.padding(.bottom)
            
                    //Add Note Part
                    HStack{
                        Image(systemName: "square.and.pencil").padding(.leading)
                        TextField("add note", text: $note).padding()
                    }.padding(.trailing)
                        .foregroundColor(.secondary)
                    
                    //Selected Category Part
                    HStack{
                        Image(systemName: "tag").padding(.leading)
                            .padding(.trailing)
                        Text("\(selectedCategory)")
                        Spacer()
                    }.padding(.trailing)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                    
                    //Category Part
                    LazyVGrid(columns: threeColumnGrid){
                        ForEach(myCategories.categories, id: \.id){
                            viewItem in
                            CategoryView(categoryName: viewItem.categoryName, categoryPicName: viewItem.categoryPicName, selectedCategory: $selectedCategory)
                            
                        }
                    }.padding(.bottom,30)
                   
                    
                    Button {
                        //Action
                        
                        myTasks.addTaskToCategory(myCategories: myCategories, newTask: TaskModel(textFieldText: text, date: taskDate, note: note), selectedCategory: selectedCategory)
                        
                        
                        isNewTaskView.toggle()
                        //rollback
                        
                        
                    } label: {
                        
                        Text("Add")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
//                    .fullScreenCover(isPresented: self.$isToDoListView, content: {
//                        ToDoList()
//                    })
//

                    
                    
                    Spacer()
                }
                
            }
            

                .navigationTitle("New Task")
                .toolbar{
                    Button {
                        isNewTaskView.toggle()
                        
                        
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(isNewTaskView: .constant(false), myCategories: CategoryViewModel(), myTasks: TaskViewModel())
    }
}
