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
    
    @Binding var isDetailViewOn : Bool
    var categoryName : String
    var categoryPicName : String
    var taskCounter : Int
    
    var body: some View {
        
        
        NavigationView{
            
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        Image("back")
                            .onTapGesture {
                            isDetailViewOn.toggle()
                        }
                            .frame(width: 35, height: 35)
                        Spacer()
                    }.padding(.bottom)
                    
                    HStack{
                        ZStack{
                            Circle().frame(width: 70, height: 70, alignment: .leading).colorInvert()
                            Image(categoryPicName)
                        }
                        Spacer()
                    }.padding(.leading)
                    
                    
                    VStack{
                        HStack{
                            Text(categoryName)
                                .font(.title3).bold()
                                .colorInvert()
                            Spacer()
                        }
                        HStack{
                            Text("\(taskCounter) Tasks")
                                .colorInvert()
                            Spacer()
                        }
                    }.padding(.leading)
                    
                    ZStack{
                        VStack{
                            Spacer()
                            Rectangle().cornerRadius(40)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7)
                                .colorInvert()
                                .position(x: 180,y:330)
                        }
                        VStack{
                            

                            
                            ZStack{
                                VStack{
                                    
                                    ScrollView{
                                        
                                        
                                            ForEach (myCategories.categories[getIndex(myCategories: myCategories, catName: categoryName)].tasks, id: \.id){ listedTasks in
                                                Divider()
                                                VStack{
                                                    HStack{
                                                        Text(listedTasks.textFieldText).padding(.leading)
                                                            .frame(height: 30)
                                                            .font(.title3)
                                                        Spacer()
                                                        
                                                        Button {
                                                            
                                                        } label: {
                                                            Image("checkbox").resizable()
                                                                .frame(width: 30, height: 30, alignment: .center)
                                                        }.padding(.trailing)
                                                            .frame(height: 30)
                                                    }
                                                    HStack{
                                                        Text(listedTasks.date.formatted())
                                                            .font(.footnote)
                                                        Spacer()
                                                    }.padding(.leading)
                                                    
                                                    
                                                }
                                            }
                                        
                                        
                                        
                                    }.position(x:180, y:300)
                                        .padding(.top)
                                    
                                }
                            }
                            
                            
                        }
                    }
                    Spacer()
                }.padding()
            }
        }
        
    }
}

func getIndex(myCategories : CategoryViewModel , catName : String) -> Int{
    
//    return myCategories.getCategoryIndexByName(categoryName: catName)
    return myCategories.getCategoryIndexByName(categoryName: catName)
    
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(myCategories: CategoryViewModel(), myTasks: TaskViewModel(), isDetailViewOn: .constant(false), categoryName: "All", categoryPicName: "task_all", taskCounter: 3)
    }
}
