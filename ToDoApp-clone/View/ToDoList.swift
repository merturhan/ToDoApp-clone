//
//  ToDoList.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 4.03.2023.
//

import SwiftUI

struct ToDoList: View {
    
    @EnvironmentObject var myCategories : CategoryViewModel
    @State var isToDoList : Bool = false
    @State private var twoColumns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        
        
        ZStack{
            Color.secondary.opacity(0.1)
                .ignoresSafeArea()
            
            ZStack{
                ScrollView{
                                
                                LazyVGrid(columns: twoColumns){
                                    
                                    ForEach(myCategories.categories, id: \.id){
                                        viewItem in
                                        
                                            ToDoGridView(categoryName: viewItem.categoryName, categoryPicName: viewItem.categoryPicName, counter: viewItem.counter, allCounter: CategoryModel.allCounter)
                                        
                                    }.padding(.leading)
                                        .padding(.trailing)
                                    
                                }
                }.onChange(of: CategoryModel.allCounter){ id in
                    print("değişti")
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button{
                            //Go to NewTaskView()
                            //self.isNewTaskViewOn.toggle()
                            for i in 0...13{
                                print(myCategories.categories[i].counter)
                                //print(CategoryModel.allCounter)
                            }
                            for i in 0...13{
                                myCategories.categories[i].increaseCounter()
                            }
                            
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
                            
                        }
                    }
                }.padding()
            }
            
            
            
            
        }
        
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList().environmentObject(CategoryViewModel())
    }
}
