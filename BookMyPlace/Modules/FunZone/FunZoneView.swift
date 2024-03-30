//
//  FunZoneView.swift
//  BookMyPlace
//
//  Created by Vinayak Bora on 30/03/24.
//

import SwiftUI

struct FunZoneView: View {
    
    @State var date = Date()
    @State var email : String = ""
    @State var selectedSlot : [TimeSlot] = TimeSlotsList().timeSlots
    @State var playZone : [PlayZone] = PlayZoneList().playZones
    @State var location : [Location] = LocationList().locations
    @State private var selectedLocation: String? = nil
    @State private var selectedPlayZone: String? = nil
    @State private var selectedTime: String? = nil
    
    enum gradientColors {
        case blue
        case green
        case grey
        
        func getGradient() -> [Color]{
            switch self {
            case .blue:
                return [.blue, .blue.opacity(0.70)]
            case .green:
                return [.green, .green.opacity(0.70)]
            case .grey:
                return[.gray, .gray]
            }
        }
    }
    
    var body: some View {
        
        VStack(alignment:.leading){
            
            ZStack{
                Image("tt_image")
                    .resizable()
                    .cornerRadius(10)
                    .shadow(radius: 5)
                LinearGradient(colors: [.clear, .black], startPoint: .topTrailing, endPoint: .bottomLeading)
                VStack{
                    HStack{
                        VStack(alignment: .leading, content: {
                            Spacer()
                            Text("Fun Zone")
                                .font(Font.custom("Nunito-Bold", size: 40))
                                .foregroundStyle(.white)
                        })
                        .padding()
                        Spacer()
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            
            
            VStack(alignment: .leading){
                
                VStack(alignment: .leading){
                    
                    Text("Select Location")
                        .font(.system(size:15))
                        .padding(EdgeInsets.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                    
                    HStack{
                        ScrollViewReader { (value: ScrollViewProxy) in
                            ScrollView(.horizontal){
                                LazyHStack {
                                    
                                    ForEach(location, id:\.self) { items in
                                        Button(action: {
                                            if selectedLocation == items.name {
                                                selectedLocation = nil
                                                                            } else {
                                                                                selectedLocation = items.name
                                                                            }
                                        }) {
                                            Text(items.name)
                                                .foregroundColor(.white)
                                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                                .font(.system(size: 13))
                                                .bold()
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                        }
                                        .frame(width: 110, height: 40)
                                        .background(selectedLocation == items.name ? LinearGradient(colors: gradientColors.blue.getGradient(), startPoint: .top, endPoint: .bottom) : LinearGradient(colors: gradientColors.green.getGradient(), startPoint: .top, endPoint: .bottom))
                                        .cornerRadius(10)
                                    }
                                }
                                
                            }
                            .scrollIndicators(.hidden)
                            .frame(width: .infinity, height: 40)
                        }
                    }
                }
                
                VStack(alignment: .leading){
                    
                    Text("Select Play Zone")
                        .font(.system(size:15))
                        .padding(EdgeInsets.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                    
                    HStack{
                        ScrollViewReader { (value: ScrollViewProxy) in
                            ScrollView(.horizontal){
                                LazyHStack {
                                    
                                    ForEach(playZone, id:\.self) { items in
                                        
                                        Button(action: {
                                            if selectedPlayZone == items.name {
                                                selectedPlayZone = nil
                                                                            } else {
                                                                                selectedPlayZone = items.name
                                                                            }
                                            
                                        }) {
                                            Text(items.name)
                                                .foregroundColor(.white)
                                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                                .font(.system(size: 13))
                                                .bold()
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                        }
                                        .frame(width: 110, height: 40)
                                        .background(selectedPlayZone == items.name ? LinearGradient(colors: gradientColors.blue.getGradient(), startPoint: .top, endPoint: .bottom) : LinearGradient(colors: gradientColors.green.getGradient(), startPoint: .top, endPoint: .bottom))
                                        .cornerRadius(10)
                                    }
                                    
                                }
                                
                            }
                            .frame(width: .infinity, height: 40)
                            .scrollIndicators(.hidden)
                            
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    
                    Text("Select Time Slot")
                        .font(.system(size:15))
                        .padding(EdgeInsets.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                    
                    HStack{
                        ScrollViewReader { (value: ScrollViewProxy) in
                            ScrollView(.horizontal){
                                LazyHStack {
                                    
                                    ForEach(selectedSlot, id:\.self) { items in
                                        
                                        Button(action: {
                                            if selectedTime == items.name {
                                                selectedTime = nil
                                                                            } else {
                                                                                selectedTime = items.name
                                                                            }
                                            
                                        }) {
                                            Text(items.name)
                                                .foregroundColor(.white)
                                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                                .font(.system(size: 13))
                                                .bold()
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                        }
                                        .frame(width: 120, height: 40)
                                        .background(selectedTime == items.name ? LinearGradient(colors: gradientColors.blue.getGradient(), startPoint: .top, endPoint: .bottom) : LinearGradient(colors: gradientColors.green.getGradient(), startPoint: .top, endPoint: .bottom))
                                        .cornerRadius(10)
                                    }
                                    
                                }
                                
                            }
                            .frame(width: .infinity, height: 40)
                            .scrollIndicators(.hidden)
                            
                        }
                    }
                }
                
                HStack {
                    DatePicker(
                        "Select Date:",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                }.padding(EdgeInsets(top: 20, leading: 2, bottom: 2, trailing: 2))
                
                
            }.padding()
            
            HStack{
                Spacer()
                Button {
                    
                }label: {
                    Text("Confirm Booking")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                }.frame(maxWidth: 300, maxHeight:40)
                    .background(LinearGradient(colors: gradientColors.grey.getGradient(), startPoint: .top, endPoint: .bottom))
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    .padding()
                Spacer()
            }
        }
    }
}

struct TimeSlot: Identifiable, Hashable {
    let id: UUID
    let name: String
}

struct TimeSlotsList{
    var timeSlots : [TimeSlot] = [
        
        TimeSlot(id: UUID(), name: "10:00 - 11:00"),
        TimeSlot(id: UUID(), name: "11:00 - 12:00"),
        TimeSlot(id: UUID(), name: "12:00 - 13:00"),
        TimeSlot(id: UUID(), name: "13:00 - 14:00"),
        TimeSlot(id: UUID(), name: "14:00 - 15:00"),
        TimeSlot(id: UUID(), name: "15:00 - 16:00"),
        TimeSlot(id: UUID(), name: "16:00 - 17:00"),
        TimeSlot(id: UUID(), name: "17:00 - 18:00")
    ]
}

struct PlayZone: Identifiable, Hashable {
    let id: UUID
    let name: String
}

struct PlayZoneList{
    var playZones : [PlayZone] = [
        PlayZone(id: UUID(), name: "Table Tennis"),
        PlayZone(id: UUID(), name: "Fuss Ball"),
        PlayZone(id: UUID(), name: "Pool Table"),
    ]
}

struct Location: Identifiable, Hashable {
    let id: UUID
    let name: String
}

struct LocationList{
    var locations : [Location] = [
        Location(id: UUID(), name: "SmartWorks"),
        Location(id: UUID(), name: "B1"),
        Location(id: UUID(), name: "B2"),
        Location(id: UUID(), name: "B3")
    ]
}



#Preview {
    FunZoneView()
}
