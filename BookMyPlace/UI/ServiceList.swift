//
//  ServiceList.swift
//  BookMyPlace
//
//  Created by Akash Gurnale2 on 30/03/24.
//

import SwiftUI

struct ServiceList: View {
    
    @State var tap: Bool = false
    @State var tappedItem: Int? = nil
    private var data  = [1,2]
    private let adaptiveColumn = [
        GridItem(.flexible(minimum: 150, maximum: UIScreen.screenWidth))
    ]
    
    
    var body: some View {
        
        ScrollView(.vertical) {
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
                                Text(String("Item"))
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
        .padding(.top, 60)
    }
}

#Preview {
    ServiceList()
}
