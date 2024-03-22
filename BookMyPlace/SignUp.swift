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
        VStack(alignment:.center){
            Text("Register").font(.system(size: 30))
                .bold()
                .padding()
            
            Image("one_bajaj_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            

            CustomTextFieldView(data: $fullName, title: "Full Name")
            CustomTextFieldView(data: $employeeId, title: "Employee ID")
            CustomTextFieldView(data: $companyName, title: "Company Name" )
            CustomTextFieldView(data: $campusName, title: "Campus Name" )
            
            
            Button {
                print("fullName is \($fullName)")
                print("Password id \($employeeId)")
            }label: {
                Text("Register")
                    .font(.system(size: 25))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }.frame(maxWidth: .infinity, maxHeight:50)
                .background(.gray)
                .foregroundColor(.white)
                .cornerRadius(5)
                .padding()
            
            Spacer()
        }
//        .background(
//               LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .trailing)
//           )
    }
}

#Preview {
    SignUp()
}
