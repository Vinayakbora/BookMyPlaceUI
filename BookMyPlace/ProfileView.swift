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
        ZStack(alignment: .top) {
            Rectangle()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 150)
                .foregroundColor(.primaryLightBlue)
            Image("one_bajaj_logo")
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}


struct ProfileText: View {
    
    let networkHelper = NetworkHelper()
    
    @State var username: String  = UserDefaults.standard.value(forKey: "username") as? String ?? ""
//    @State var employeeId : String = "1001760"
    @State  var campusName: String = "Smartworks"
    @State var email: String = UserDefaults.standard.value(forKey: "email") as? String ?? ""
    @State  var companyName: String = "Bajaj Markets"
    
    @State var userData: Profile?
    
    var body: some View {
       
        Spacer()
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
