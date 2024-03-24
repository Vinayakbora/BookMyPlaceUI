//
//  TableTennisView.swift
//  BookMyPlace
//
//  Created by Mallika Roy on 24/03/24.
//

import SwiftUI

struct TableTennisView: View {
    var body: some View {
        VStack{
            Image("table_tennis")
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 50)
                
        }
    }
}

#Preview {
    TableTennisView()
}
