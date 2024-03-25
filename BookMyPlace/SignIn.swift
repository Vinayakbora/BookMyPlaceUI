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
                    .frame(width: 120, height: 120)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding([.bottom], 40)
                CustomTextFieldView(data: $employeeId, title: "Employee ID")
                    .padding([.leading, .trailing])
                CustomSecuredTextField(data: $password, title: "Password" )
                    .padding([.leading, .trailing])
                
                
                Button {
                    print("Employee ID is \($employeeId)")
                    print("Password id \($password)")
                }label: {
                    Text("Login")
                        .font(.system(size: 25))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.frame(maxWidth: .infinity, maxHeight:50)
                    .background(LinearGradient(colors: [.primaryLightBlue, .primaryDarkBlue], startPoint: .top, endPoint: .bottom))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding([.leading, .trailing, .top], 25)
                    .shadow(radius: 5)
                
                HStack{
                    Text("Don't have an account?").foregroundStyle(.gray)
                    
                    NavigationLink(destination: SignUp()){
                        Text("Sign Up")
                            .foregroundStyle(Color.primaryDarkBlue)
                            .underline()
                    }
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0))


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
