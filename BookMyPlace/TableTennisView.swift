//
//  TableTennisView.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 24/03/24.
//

import SwiftUI

struct TableTennisView: View {
  
    @State var date = Date()
    @State var email : String = ""
    @State var selectedSlot : [Slot] = SlotsList().slots
    
    var body: some View {
        
        VStack(alignment:.leading){
            Image("table_tennis")
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(maxWidth:.infinity, maxHeight: 250)
            
            
            VStack(alignment: .leading){
                Text("Table Tennis")
                    .bold()
                    .font(.system(size:15))
                
                Text("Floor,place,Pune")
                    .font(.system(size:13))
                    .padding(EdgeInsets.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                
                HStack{
                    Text("Select your slot")
                        .font(.system(size:13))
                        .padding(EdgeInsets.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                    Text("CLEAR")
                        .font(.system(size:13))
                        .foregroundColor(.blue)
                        .padding(EdgeInsets.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                    
                }
                HStack{
                    ScrollViewReader { (value: ScrollViewProxy) in
                        ScrollView(.horizontal){
                            LazyHStack {
                                
                                ForEach(selectedSlot, id:\.self) { items in
                                    
                                    
                                    Text(items.name)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 5))
                                        .font(.system(size: 13))
                                        .bold()
                                        .lineLimit(2)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(width: 60, height: 60)
                                .background(.green)
                                .cornerRadius(10)
                                
                            }
                            
                        }
                        .frame(width: .infinity, height: 70)
                        
                        Image(systemName:"chevron.right").onTapGesture {
                            value.scrollTo(selectedSlot.last)
                        }
                    }
    //                                .scrollIndicators(ScrollIndicatorVisibility.hidden)
                   
                    
                }
                
                
                HStack {
                    DatePicker(
                        "Date:",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                }
                Divider()
                
                HStack {
                    Text("Add Attendees")
                        .font(.system(size:13))
                        .padding(EdgeInsets.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                    TextField("Type the email address", text: $email ).foregroundColor(.black)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                    Spacer()
                    
                    Button{
                        
                    }label:{
                        Text("Add").foregroundColor(.black)
                            .frame(minWidth: 0, maxHeight: 0)
                            .font(.system(size: 11))
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(.black,lineWidth: 2))
                    }
                    
                    .cornerRadius(25)
                }
                
            }.padding()
            
            Button {
                
            }label: {
                Text("Confirm Booking")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
            }.frame(maxWidth: .infinity, maxHeight:40)
                .background(.gray)
                .foregroundColor(.black)
                .cornerRadius(50)
                .padding()
        }
        Spacer()
    }
}

struct Slot: Identifiable, Hashable {
    let id: UUID
    let name: String
}

struct SlotsList{
    var slots : [Slot] = [
        
        Slot(id: UUID(), name: "10:00 AM"),
        Slot(id: UUID(), name: "11:00 AM"),
        Slot(id: UUID(), name: "12:00 PM"),
        Slot(id: UUID(), name: "1:00 PM"),
        Slot(id: UUID(), name: "2:00 PM"),
        Slot(id: UUID(), name: "3:00 PM"),
        Slot(id: UUID(), name: "4:00 PM"),
        Slot(id: UUID(), name: "5:00 PM"),
        Slot(id: UUID(), name: "6:00 PM"),
    ]
}

#Preview {
    TableTennisView()
}
