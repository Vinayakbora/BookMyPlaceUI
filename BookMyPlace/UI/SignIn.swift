//
//  ContentView.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 22/03/24.
//

import SwiftUI

struct SignIn: View {
    
    @State var username : String = ""
    @State var password : String = ""
    @State var focusedField : String = ""
    @State var isEmployeeIdValid : Bool = false
    @State var isPasswordValid : Bool = true
        
    let networkHelper = NetworkHelper()
    
    var body: some View {
        
        NavigationView{
            VStack(alignment:.center){
                VStack{
                    ZStack(content: {
                        VStack{
                            Image("CardBackground")
                                .resizable()
                                .frame(width: UIScreen.screenWidth, height: 200)
                                .shadow(radius: 5)
                            Spacer()
                        }

                        LinearGradient(colors: [.clear, .black], startPoint: .topTrailing, endPoint: .bottomLeading)
                        VStack{
                            Spacer()
                            Text("Login").font(.system(size: 30))
                                .foregroundStyle(.white)
                                .bold()
                                .padding()
                        }

                    })
                }
                .frame(height: 200)

//
//                Image("one_bajaj_logo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 120)
//                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                    .padding([.bottom], 40)
                CustomTextFieldView(data: $username, title: "User Name")
                    .padding([.leading, .trailing])
                CustomSecuredTextField(data: $password, title: "Password" )
                    .padding([.leading, .trailing])
                
                
                Button {
                    print("Username is \($username)")
                    print("Password id \($password)")
                    
                    Task{
                        await loginApiCall()
                    }
                    
                }label: {
                    Text("Login")
                        .font(.system(size: 25))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.frame(maxWidth: .infinity, maxHeight:50)
                    .background(LinearGradient(colors: [.black, .black.opacity(0.80)], startPoint: .top, endPoint: .bottom))
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
            .ignoresSafeArea(edges: .top)
        }
        .ignoresSafeArea(edges: .top)
    }
    
    func TextFieldIsNotEmpty(_ string : String) -> Bool {
        if(string.isEmpty){
            return false
        }
        return true
    }
    
    
    
    func loginApiCall() async{
        
        guard let url =  URL(string: "http://192.168.1.3:8081/api/v1/user/login/") else {
            return
        }
        
        await networkHelper.callNetworkMethod(for: url, with : LoginRequest(username: username, password: password),  requestType: .post, completionHandler: {data, response, error in
            
            do{
                let response = try JSONDecoder().decode(LoginResponse.self, from: data!)
                
                if response.username != nil {
                    print("Login successfull for \(String(describing: response.username))")
                }else{
                    print("Login failed, Please Check details and try again!")
                    // Navigation to home page
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        )
    }
}

//#Preview {
//    SignIn()
//}
