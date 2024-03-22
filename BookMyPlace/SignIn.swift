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
                
                Image("one_bajaj_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
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
//            .background(
//                LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .trailing)
//            )
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
