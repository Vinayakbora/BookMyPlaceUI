//
//  SignUp.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 22/03/24.
//

import SwiftUI

struct SignUp: View {
    
    @State var email: String  = ""
    @State var name : String = ""
    @State var username: String = ""
    @State  var password: String = ""
    
    let networkHelper = NetworkHelper()
    
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
                
                CustomTextFieldView(data: $email, title: "Enter Email")
                CustomTextFieldView(data: $name, title: "Enter Name")
                CustomTextFieldView(data: $username, title: "Enter User Name" )
                CustomTextFieldView(data: $password, title: "Enter Password" )
                
                    .padding([.leading, .trailing], 15)
                
                Button {
                    Task{
                        await registrationApiCall()
                    }
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
    
    func registrationApiCall() async{
        
        guard let url =  URL(string: "http://192.168.1.3:8081/api/v1/user/") else {
            return
        }
        
        await networkHelper.callNetworkMethod(for: url, with : UserRequest(email: email, name:name, username: username, password: password),  requestType: .post, completionHandler: {data, response, error in
            
            do{ 
                let decoder = JSONDecoder()
            
                let responseData = try JSONDecoder().decode(UserResponse.self, from: data!)
                
                if responseData.id != nil {
                    isRegisterSuccess = true
                    print("Registraion is successfull for \(String(describing: responseData.name))")
                    
                }else{
                    print("Registration failed, Please Check details and try again!")
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        )
    }
}
    


struct SignupInputFieldView: View {
    @State var email: String  = ""
    @State var name : String = ""
    @State var username: String = ""
    @State  var password: String = ""
    
    var body: some View {
        VStack{
            CustomTextFieldView(data: $email, title: "Enter Email")
            CustomTextFieldView(data: $name, title: "Enter Name")
            CustomTextFieldView(data: $username, title: "Enter User Name" )
            CustomTextFieldView(data: $password, title: "Enter Password" )
        }
    }
}

//#Preview {
//    SignUp()
//}
