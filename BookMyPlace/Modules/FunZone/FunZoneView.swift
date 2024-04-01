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
    @State var playZone : [PlayZone]?
    @State var showAlert = false
    @State var meetingRooms : [MeetingRoom]?
    
    @State var bookedRoom : BookMeetingRoomResponse?
    @State var location : [Location]?
    @State private var selectedLocation: String? = nil
    @State private var selectedPlayZone: String? = nil
    
    @State private var selectedTime: String? = nil
    
    let networkHelper = NetworkHelper()
    
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
                                    if !(location?.isEmpty ?? true){
                                        if let locations = location{
                                            ForEach(locations) { items in
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
                                if !(meetingRooms?.isEmpty ?? true){
                                    LazyHStack {
                                        if let meetingRooms_ = meetingRooms{
                                            ForEach(meetingRooms_) { items in
                                                
                                                Button(action: {
                                                    if selectedPlayZone == items.name {
                                                        selectedPlayZone = nil
                                                    } else {
                                                        selectedPlayZone = items.name
                                                    }
                                                    
                                                }) {
                                                    Text(items.name ?? "")
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
                    if selectedLocation != nil && selectedPlayZone != nil  && selectedTime != nil {
                        Task{
                            await bookMeetingRoom()
                        }
                    }
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
        }.onAppear{
            Task{
                await getAllLocations()
            }
        }
        .onChange(of: selectedLocation) { newLocation  in
            //call Api to get meeting rooms by location
            Task{
                await getMeetingRoomsByLocation()
            }
        }
        
        
        
    }
    
    
    func getAllLocations() async{
        guard let url =  URL(string: "\(NetworkHelper.baseUrl)location") else {
            return
        }
        
        
        
        await networkHelper.callNetworkMethod(for: url, requestType: .get, completionHandler: {data, response, error in
            
            do{
                guard let responseData = data else { return }
                let response = try JSONDecoder().decode(LocationResponse.self, from: responseData)
                
                if let isLocations = response.data?.isEmpty, isLocations{
                    print("No Locations Available")
                }else{
                    location = response.data
                    
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        )
    }
    
    
    func getMeetingRoomsByLocation() async{
        
        let selectedLocationid = location?.filter({ location in
            return location.name == selectedLocation
        }).first?.id
        
        if selectedLocationid != nil{
            guard let url =  URL(string: "\(NetworkHelper.baseUrl)meetingroom/by-location") else {
                return
            }
            
            await networkHelper.callNetworkMethod(for: url, with : MeetingRoomRequest(locationId: selectedLocationid),  requestType: .post, completionHandler: {data, response, error in
                
                do{
                    guard let responseData = data else { return }
                    let response = try JSONDecoder().decode(MeetingRoomResponse.self, from: responseData)
                    
                    if let isMeetingRoom = response.data?.isEmpty, isMeetingRoom {
                        
                        print("Meeting Room Not found by Location")
                        
                    }else{
                        
                        meetingRooms = response.data
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            )
        }
    }
    
    func bookMeetingRoom() async{
        
        let selectedMeetingid = meetingRooms?.filter({ meetingRoom in
            return meetingRoom.name == selectedPlayZone
        }).first?.id
        
        if selectedMeetingid != nil{
            guard let url =  URL(string: "\(NetworkHelper.baseUrl)bookroom") else {
                return
            }
            
            
            
            var startTime = selectedTime?.components(separatedBy: " - ")[0] ?? ""
            var endTime = selectedTime?.components(separatedBy: " - ")[1] ?? ""
            
            var bookingDate = DateFormatUtility.shortString(fromDate: date)
            
            await networkHelper.callNetworkMethod(for: url, with : BookRoomRequest(meetingRoom: MeetingRoomTemp(id : selectedMeetingid!), userEmail: "", startTime: startTime, endTime: endTime, bookingDate: bookingDate),  requestType: .post, completionHandler: {data, response, error in
                
                do{
                    guard let responseData = data else { return }
                    let response = try JSONDecoder().decode(BookMeetingRoomResponse.self, from: responseData)
                    let meetingId = response.data.meetingRoom.id
                    if meetingId > 0{
                        
                        
                        
                    }else{
                        
                       
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            )
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

struct Location: Identifiable, Decodable {
    let id: Int
    let name: String
    let city : String
    let timestamp : String
}

//struct LocationList{
//    var locations : [Location] = [
//        Location(id: UUID(), name: "SmartWorks"),
//        Location(id: UUID(), name: "B1"),
//        Location(id: UUID(), name: "B2"),
//        Location(id: UUID(), name: "B3")
//    ]
//}



#Preview {
    FunZoneView()
}
