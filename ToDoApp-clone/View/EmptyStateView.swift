//
//  EmptyStateView.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 3.03.2023.
//

import SwiftUI

struct EmptyStateView: View {
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                BackgroundView()
                
                VStack{
                    Spacer()
                    HStack{
                            Spacer()
                        Button {
                            print("test")
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
            .navigationTitle("ToDo")
        }
        
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
