//
//  ProfileData2.swift
//  App02-MiPerfil
//
//  Created by David Josué Marcial Quero on 23/09/21.
//

import SwiftUI

struct ProfileDataView: View {
    
    @Binding var name: String
    @Binding var date: Date
    @Binding var backgroundColor: Color
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Nombre:")
            TextField("Nombre", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Fecha de nacimiento:")
            DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                Text("\(dateFormat.string(from: date))")
            }
            ColorPicker("Color del fondo", selection: $backgroundColor)
        }
        .padding(.horizontal, 60)
    }
}

struct ProfileDataView_Previews: PreviewProvider {
    
    @State static var name: String = "David"
    @State static var date: Date = Date()
    @State static var backgroundColor: Color = Color("Background")
    
    static var previews: some View {
        ProfileDataView(name: $name, date: $date, backgroundColor: $backgroundColor)
    }
}
