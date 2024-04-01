//
//  ProfileScreen.swift
//  BookMyPlace
//
//  Created by Vinayak Bora on 28/03/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isPresented = false
    
    var body: some View {
        VStack {
            VStack {
                Header()
                ProfileText()
            }
        }
    }
}


struct Header: View {
    var body: some View {
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
                    Text("Profile").font(.system(size: 30))
                        .foregroundStyle(.white)
                        .bold()
                        .padding()
                }

            })
        }
        .frame(height: 200)
    }
}


struct ProfileText: View {
    
    @EnvironmentObject private var appRootManager : AppRootManager

    let networkHelper = NetworkHelper()
    
    @State var username: String  = UserDefaults.standard.value(forKey: "username") as? String ?? ""
//    @State var employeeId : String = "1001760"
    @State  var campusName: String = "Smartworks"
    @State var email: String = UserDefaults.standard.value(forKey: "email") as? String ?? ""
    @State  var companyName: String = "Bajaj Markets"
    
    @State var userData: Profile?
    
    var body: some View {
       
        VStack(spacing: 50) {
            VStack {
                Text("Employee Name")
                    .bold()
                    .font(.subheadline)
                Text(userData?.name ?? "Vinayak Bora")
                    .font(.title)
            }
            
            VStack {
                Text("Employee Email ID")
                    .bold()
                    .font(.subheadline)
                Text(userData?.email ?? "mallika.roy@bajajfinserv.in")
                    .font(.title)
            }
            
            VStack {
                Text("Company Name")
                    .bold()
                    .font(.subheadline)
                Text(companyName)
                    .font(.title)
            }
            
            VStack {
                Text("Campus Name")
                    .bold()
                    .font(.subheadline)
                Text(campusName)
                    .font(.title)
            }
            Button {
                UserDefaults.standard.removeObject(forKey: "token")
                appRootManager.currentRoot = .login
                
            }label: {
                Text("Logout")
                    .font(.system(size: 25))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }.frame(maxWidth: .infinity, maxHeight:50)
                .background(LinearGradient(colors: [.black, .black.opacity(0.70)], startPoint: .top, endPoint: .bottom))
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding([.leading, .trailing, .top], 25)
                .shadow(radius: 5)
        }.onAppear() {
            Task{
                await self.getProfileDetails()
            }
           
        }
        
        .padding()
        Spacer()
    }
    
    func getProfileDetails() async {
        guard let url = URL(string: "\(NetworkHelper.baseUrl)profile/\(username)") else {
            return
        }
        
        await networkHelper.callNetworkMethod(for: url, requestType: .get , completionHandler: {data, response, error in
            do{
                let response = try JSONDecoder().decode(ProfileResponse.self, from: data!)
                
                if response.data?.id != nil {
                    print("Profile for \(String(describing: response))")
                    self.userData = response.data
                }else{
                    print("Profile api fail")
                }
                
            }catch{
                print(error.localizedDescription)
            }
        }
        )
            
    }
}


#Preview {
    ProfileView()
}
