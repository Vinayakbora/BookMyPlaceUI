//
//  SignUp.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 22/03/24.
//

import SwiftUI

struct SignUp: View {
    
    @State var fullName: String  = ""
    @State var employeeId : String = ""
    @State var companyName: String = ""
    @State  var campusName: String = ""
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment:.center){
                Text("Register").font(.system(size: 30))
                    .bold()
                    .padding()
                
                Image("one_bajaj_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 25)
                
                SignupInputFieldView(fullName: fullName,
                                     employeeId: employeeId,
                                     companyName: companyName,
                                     campusName: campusName)
                .padding([.leading, .trailing], 15)
                
                Button {
                    print("fullName is \($fullName)")
                    print("Password id \($employeeId)")
                }label: {
                    Text("Register")
                        .font(.system(size: 25))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.frame(width: UIScreen.main.bounds.size.width - 40, height: 55)
                    .background(LinearGradient(colors: [.primaryLightBlue, .primaryDarkBlue], startPoint: .top, endPoint: .bottom))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 25)
                    .shadow(radius: 5)
                
                
                Spacer()
            }
        }
    }
}


struct SignupInputFieldView: View {
    @State var fullName: String  = ""
    @State var employeeId : String = ""
    @State var companyName: String = ""
    @State  var campusName: String = ""
    
    var body: some View {
        VStack{
            CustomTextFieldView(data: $fullName, title: "Full Name")
            CustomTextFieldView(data: $employeeId, title: "Employee ID")
            CustomTextFieldView(data: $companyName, title: "Company Name" )
            CustomTextFieldView(data: $campusName, title: "Campus Name" )
        }
    }
}

#Preview {
    SignUp()
}
