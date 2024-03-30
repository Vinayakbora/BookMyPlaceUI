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
//    let uerProfile = Profile(from: <#Decoder#>)
    
    @State var fullName: String  = "Vinayak Bora"
    @State var employeeId : String = "1001760"
    @State var companyName: String = "Bajaj Markets"
    @State  var campusName: String = "Smartworks"
    
    var body: some View {
        Spacer()
        VStack(spacing: 50) {
            VStack {
                Text("Employee Name")
                    .bold()
                    .font(.subheadline)
                Text(fullName)
                    .font(.title)
            }
            
            VStack {
                Text("Employee ID")
                    .bold()
                    .font(.subheadline)
                Text(employeeId)
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
        }
        
        .padding()
        Spacer()
    }
    
    func getProfileDetails() async{
        guard let url = URL(string: "http://192.168.1.3:8081/api/v1/user/mallika") else {
            return
        }
        
        await networkHelper.callNetworkMethod(for: url, requestType: .get , completionHandler: {data, response, error in
            do{
                let response = try JSONDecoder().decode(ProfileResponse.self, from: data!)
                
                if response.data.id != nil {
                    print("Login successfull for \(String(describing: response))")
                }else{
                    print("")
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
