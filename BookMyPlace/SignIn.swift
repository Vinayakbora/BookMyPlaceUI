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
    
    var body: some View {
        
        VStack(alignment:.center){
            Text("Login").font(.system(size: 30))
                .bold()
                .padding()
            
                TextField("Enter your Employee Id",
                          text: $employeeId)
                .padding(15)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    print("Employee ID is \($employeeId)")
                }
            
                TextField("Enter your Password",
                          text: $password)
                .padding()
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    print("Password id \($password)")
                }
            
            HStack{
                Text("Don't have an account?").foregroundStyle(.gray)
                Text("Sign Up")
                    .foregroundStyle(.red)
                    .underline()
                    .onTapGesture {
                    print("Sign Up clicked")
                }
            }
            
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
#Preview {
    SignIn()
}
