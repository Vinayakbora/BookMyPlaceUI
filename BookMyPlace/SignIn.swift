//
//  ContentView.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 22/03/24.
//

import SwiftUI

struct SignIn: View {
    
    @State var employeeId : String = ""
    @State var password : String = ""
    @State var focusedField : String = ""
    @State var isEmployeeIdValid : Bool = false
    @State var isPasswordValid : Bool = true
    
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment:.center){
                Text("Login").font(.system(size: 30))
                    .bold()
                    .padding()
                
                CustomTextFieldView(data: $employeeId, title: "Employee ID")
                CustomSecuredTextField(data: $password, title: "Password" )

                HStack{
                    Text("Don't have an account?").foregroundStyle(.gray)
                    
                    NavigationLink(destination: SignUp()){
                        Text("Sign Up")
                            .foregroundStyle(.red)
                            .underline()
                    }
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0))
    
                
                
                Button {
                    print("Employee ID is \($employeeId)")
                    print("Password id \($password)")
                }label: {
                    Text("Login")
                        .font(.system(size: 25))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.frame(maxWidth: .infinity, maxHeight:50)
                    .background(.gray)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding()
                
                Spacer()
            }
        }
    }
    
    func TextFieldIsNotEmpty(_ string : String) -> Bool {
        if(string.isEmpty){
            return false
        }
        return true
    }
}
#Preview {
    SignIn()
}

struct CustomSecuredTextField: View{
    
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
