//
//  NewTaskView.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 3.03.2023.
//

import SwiftUI

struct NewTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var text : String = ""
    @State private var taskDate = Date()
    @State private var note : String = ""
    
    @EnvironmentObject var myCategories : CategoryViewModel
    
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
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
                    }
            
                    //Add Note Part
                    HStack{
                        Image(systemName: "square.and.pencil").padding(.leading)
                        TextField("add note", text: $note).padding()
                    }.padding(.trailing)
                        .padding(.top)
                        .foregroundColor(.secondary)
                    
                    //Category Part
                    LazyVGrid(columns: threeColumnGrid){
                        ForEach(myCategories.categories, id: \.id){
                            viewItem in
                            CategoryView(categoryName: viewItem.categoryName, categoryPicName: viewItem.categoryPicName)
                        }
                    }
                   

                    
                    
                    Spacer()
                }
                
            }
            

                .navigationTitle("New Task")
                .toolbar{
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                        
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
        NewTaskView().environmentObject(CategoryViewModel())
    }
}
