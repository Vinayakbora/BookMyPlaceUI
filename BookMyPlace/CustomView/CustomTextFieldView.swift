//
//  CustomTextFieldView.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 22/03/24.
//

import SwiftUI

    struct CustomTextFieldView: View{
    
        @Binding var data: String
        var title: String?
    @State var isTextFieldValid : Bool = true
   

    var body : some View {
        ZStack {
           TextField("", text: $data, onEditingChanged: { (isChanged) in
               if(!isChanged){
                   if TextFieldIsNotEmpty(self.data)
                   {
                       isTextFieldValid = true
                   }else{
                       isTextFieldValid = false
                   }
               }
               
           })
             .padding(.horizontal, 10)
             .frame(height: 55)
             .overlay(
               RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                   .stroke(Color.gray, lineWidth: 1)
             )
            
        
           HStack {
             Text(title ?? "Input")
               .font(.headline)
               .fontWeight(.thin)
               .foregroundColor(Color.gray)
               .multilineTextAlignment(.leading)
               .padding(4)
               .background(.white)
             Spacer()
           }
           .padding(.leading, 8)
           .offset(CGSize(width: 0, height: -28))
         }.padding(10)
        
        if !self.isTextFieldValid {
            Text("\(title ?? "") is Not Valid")
                .font(.callout)
                .foregroundColor(Color.red)
        }
    }
    
    
    func TextFieldIsNotEmpty(_ string : String) -> Bool {
        if(string.isEmpty){
            return false
        }
        return true
    }
}

//#Preview {
//    CustomTextFieldView("Data", "Title")
//}
