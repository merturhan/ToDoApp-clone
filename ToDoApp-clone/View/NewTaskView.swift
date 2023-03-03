//
//  NewTaskView.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 3.03.2023.
//

import SwiftUI

struct NewTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var text = ""
    @State var noteDate = Date()
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                VStack{
                    HStack{
                        Text("What are your planning?")
                            .foregroundColor(.secondary)
                        Spacer()
                    }.padding()
                    
                    TextEditor(text: $text)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                            .border(.secondary)
                            .frame(width: UIScreen.main.bounds.width, height: 150, alignment: .top)
                            .padding()
                    
                    HStack{
                        Image(systemName: "bell.badge")
                            .foregroundColor(.blue)
                            .padding(.leading)
                        DatePicker(selection: $noteDate, in: Date()...,
                                   displayedComponents: [.date, .hourAndMinute]){
                            // code
                            
                        }.padding(.trailing, 120)
                            .colorInvert().colorMultiply(.blue)
                            
                        
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
        NewTaskView()
    }
}
