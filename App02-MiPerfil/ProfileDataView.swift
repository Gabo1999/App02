//
//  ProfileData2.swift
//  App02-MiPerfil
//
//  Created by David Josué Marcial Quero on 23/09/21.
//

import SwiftUI

struct ProfileDataView: View {
    
    @Binding var name: String
    @Binding var city: String
    @Binding var email: String
    @Binding var id: String
    @Binding var date: Date
    @Binding var backgroundColor: Color
    @Binding var fontColor: Color
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PERFÍL")) {
                    TextField("Nombre", text: $name)
                    TextField("Ciudad", text: $city)
                    TextField("Correo", text: $email)
                    TextField("ID", text: $id)
                    DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                        Text("\(dateFormat.string(from: date))")
                    }
                }
                Section(header: Text("APARIENCIA")) {
                    ColorPicker("Color del fondo", selection: $backgroundColor)
                    ColorPicker("Color de letra", selection: $fontColor)
                }
            }
            .navigationBarTitle("Configuración")
        }
    }
}

struct ProfileDataView_Previews: PreviewProvider {
    
    @State static var name: String = "David"
    @State static var date: Date = Date()
    @State static var city: String = "Oaxaca"
    @State static var email: String = "A00828702@itesm.mx"
    @State static var id: String = "A00828702"
    @State static var backgroundColor: Color = Color("Background")
    @State static var fontColor: Color = Color(.black)
    
    static var previews: some View {
        ProfileDataView(name: $name, city: $city, email: $email, id: $id, date: $date, backgroundColor: $backgroundColor, fontColor: $fontColor)
    }
}
