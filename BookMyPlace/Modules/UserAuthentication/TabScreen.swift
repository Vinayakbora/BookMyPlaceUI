//
//  TabScreen.swift
//  BookMyPlace
//
//  Created by Akash Gurnale2 on 28/03/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "homeicon"
    case profile = "profileicon"
    case services = "servicesicon"
    case bookings = "listicon"
}

struct TabScreen: View {
    
    @State var selectedTab: Tab = .home
    @Namespace var animation
    @State var xAxis: CGFloat = 0
    
    let tabs: [Tab] = [.home, .bookings, .services, .profile]
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection: $selectedTab) {
                DashboardView()
                    .ignoresSafeArea()
                    .tag(Tab.home)
                
                ServiceList()
                    .ignoresSafeArea()
                    .tag(Tab.bookings)
                
                ServiceList()
                    .ignoresSafeArea()
                    .tag(Tab.services)
                
                ProfileView()
                    .ignoresSafeArea()
                    .tag(Tab.profile)
                
            }
            CustomTabBar()
        })
        .ignoresSafeArea(edges: .bottom)
        
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        VStack(alignment: .center) {
            HStack {
                ForEach(tabs, id: \.self) { image in
                    GeometryReader { reader in
                        
                        Button {
                            withAnimation(Animation.interactiveSpring(dampingFraction: 2)) {
                                selectedTab = image
                                xAxis = reader.frame(in: .global).midX
                            }
                        } label: {
                            Image(image.rawValue)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(image == selectedTab ? getIconColor(image: image) : .white)
                                .background(Color.white.opacity(selectedTab == image ? 1 : 0).clipShape(Circle()))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(.white, lineWidth: 4)
                                }
                                .matchedGeometryEffect(id: image, in: animation)
                                .offset(x: 0 , y: selectedTab == image ? -40 : 0)
                                .foregroundStyle(.blue)
                                .shadow(radius: 5)
                        }
                        .onAppear{
                            if image == tabs.first {
                                xAxis = reader.frame(in: .global).midX
                            }
                        }
                    }
                    .frame(width: 50, height: 50)
                    
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 50)
            .padding(.vertical, 10)
        }
        .frame(maxWidth: .infinity)
        .background(LinearGradient(colors: [.black.opacity(0.70),.black], startPoint: .bottom, endPoint: .top).clipShape(CustomTabBarShape(xAxis: xAxis)).shadow(radius: 5))
    }
    
    func getIconColor(image: Tab) -> Color {
        switch image {
        case .home:
            return Color.cyan
        case .bookings:
            return Color.cyan
        case .services:
            return Color.cyan
        case .profile:
            return Color.cyan
        default:
            return Color.cyan
        }
    }
}

#Preview {
    TabScreen()
}
