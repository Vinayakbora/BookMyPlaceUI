//
//  DashboardView.swift
//  BookMyPlace
//
//  Created by Akash Gurnale2 on 25/03/24.
//

import SwiftUI



struct DashboardView: View {
    
    @State var tap: Bool = false
    @State var tappedItem: String? = nil
    private var data  = ["Meeting Spaces","Fun Zone"]
    private let adaptiveColumn = [
        GridItem(.flexible(minimum: 150, maximum: UIScreen.screenWidth))
    ]
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack{
                ZStack{
                    Image("CardBackground")
                        .resizable()
                        .frame(width: UIScreen.screenWidth, height: 400)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    LinearGradient(colors: [.clear, .black], startPoint: .topTrailing, endPoint: .bottomLeading)
                    VStack{
                        Spacer()
                        HStack{
                            VStack(alignment: .leading, content: {
                                Spacer()
                                Text("You have")
                                    .font(Font.custom("Nunito-Bold", size: 30))
                                    .foregroundStyle(.white)
                                Text("0")
                                    .font(Font.custom("Nunito-Black", size: 30))
                                    .foregroundStyle(.white)

                                Text("Active Bookings")
                                    .font(Font.custom("Nunito-Bold", size: 30))
                                    .foregroundStyle(.white)
                            })
                            .padding()
                            Spacer()
                        }
                    }
                }
                .ignoresSafeArea(edges: .top)
                
                HStack {
                    Text("What can we help you find today?")
                        .font(Font.custom("Nunito-Bold", size: 20))
                        .padding([.top, .leading])
                    Spacer()
                }
                
                LazyVGrid(columns: adaptiveColumn) {
                    ForEach(data, id: \.self) { item in
                        
                        ZStack{
                            Image("flower1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.screenWidth * 0.9, height: (UIScreen.screenWidth - 30) * 0.50, alignment: .center)
                                .clipped()
                            
                            LinearGradient(colors: [.clear, .black], startPoint: .topTrailing, endPoint: .bottomLeading)
                            
                            VStack(alignment: .leading){
                                Spacer()
                                HStack{
                                    Text(String(item))
                                        .foregroundColor(.white)
                                        .font(Font.custom("Nunito-Black", size: 30))
                                        .padding(.bottom, 10)
                                    Spacer()
                                }
                                .padding(.leading, 15)
                            }
                        }
                        .frame(width: UIScreen.screenWidth * 0.9, height: (UIScreen.screenWidth - 30) * 0.50, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .gray ,radius: 5)
                        .scaleEffect((tap && (tappedItem == item)) ? 0.8 : 1)
                        .animation(.spring(response: 0.4, dampingFraction: 0.6))
                        .onTapGesture {
                            tap = true
                            tappedItem = item
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                tap = false
                                tappedItem = nil
                            }
                        }
                    }
                }
                .padding([.leading, .trailing])
            }
            .ignoresSafeArea(edges: .top)
        }
        .ignoresSafeArea(edges: .top)
        .padding(.bottom,70)
    }
}

#Preview {
    DashboardView()
}
