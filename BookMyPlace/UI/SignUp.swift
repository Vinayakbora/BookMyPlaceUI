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
    @State private var isRegisterSuccess = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let networkHelper = NetworkHelper()
    
    var body: some View {
        ScrollView(.vertical) {
        
                VStack(alignment:.center){
                    
                    VStack{
                        ZStack(content: {
                            VStack{
                                Image("CardBackground")
                                    .resizable()
                                    .frame(width: UIScreen.screenWidth, height: 180)
                                    .shadow(radius: 5)
                                Spacer()
                            }

                            LinearGradient(colors: [.clear, .black], startPoint: .topTrailing, endPoint: .bottomLeading)
                            VStack{
                                HStack{
                                    Button {
                                        print("Back button pressed")
                                        presentationMode.wrappedValue.dismiss()
                                    } label: {
                                        Image(systemName: "chevron.backward")
                                            .foregroundStyle(Color.white)
                                    }
                                    .frame(width: 55, height: 55)
                                    Spacer()
                                }
                                .padding(.top, 44)

                                Spacer()
                                Text("Register").font(.system(size: 30))
                                    .foregroundStyle(.white)
                                    .bold()
                                    .padding()
                            }

                        })
                    }
                    .frame(height: 180)
                    
                    CustomTextFieldView(data: $email, title: "Enter Email")
                    CustomTextFieldView(data: $name, title: "Enter Name")
                    CustomTextFieldView(data: $username, title: "Enter User Name" )
                    CustomSecuredTextField(data: $password, title: "Enter Password" )
                                        
                    Button {
                        Task{
                            await registrationApiCall()
                        }
                    }label: {
                        Text("Register")
                            .font(.system(size: 25))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }.frame(width: UIScreen.main.bounds.size.width - 40, height: 55)
                        .background(LinearGradient(colors: [.black, .black.opacity(0.70)], startPoint: .top, endPoint: .bottom))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding([.leading, .trailing], 20)
                        .padding(.top, 25)
                        .shadow(radius: 5)
                    Spacer()
                }
            }
        .ignoresSafeArea(edges: .top)
        
    }
    
    func registrationApiCall() async{
        
        guard let url =  URL(string: NetworkHelper.baseUrl + "user/register") else {
            return
        }
        
        await networkHelper.callNetworkMethod(for: url, with : UserRequest(email: email, name:name, username: username, password: password),  requestType: .post, completionHandler: {data, response, error in
            
            do{
                guard let signUpData = data else { return }
                let responseData = try JSONDecoder().decode(UserResponse.self, from: signUpData)
                
                if responseData.id != nil {
                    isRegisterSuccess = true
                    print("Registraion is successfull for \(String(describing: responseData.name))")
                    DispatchQueue.main.async {
                        presentationMode.wrappedValue.dismiss()
                    }
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

#Preview {
    SignUp()
}
