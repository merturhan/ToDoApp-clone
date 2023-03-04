//
//  CategoryView.swift
//  ToDoApp-clone
//
//  Created by Mert Urhan on 4.03.2023.
//

import SwiftUI

struct CategoryView: View {
    
    var categoryName : String
    var categoryPicName : String
    
    var body: some View {
        
        HStack{
            Image("\(categoryPicName)").resizable()
                .frame(width: 31, height: 31, alignment: .leading)
            Text("\(categoryName)")
            Spacer()
        }.frame(width: 120)
            .padding(.leading)
            .border(.black)
                
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(categoryName: "Cooking", categoryPicName: "task_cooking")
    }
}
