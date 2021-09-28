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
    @Binding var imageColor: Color
    @Binding var activo: Bool
    @Binding var modalidad: String
    let modalidades = ["Remoto", "Híbrido", "Presencial"]
    var profileBackgroundColor: Color = Color("ProfileBackground")
    
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
                    Toggle(isOn: $activo) {
                                        Text("Estudante Activo")
                                    }
                    Picker("Modalidad", selection: $modalidad) {
                        ForEach(modalidades, id: \.self) {
                            Text($0)
                        }
                    }
                    DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                        Text("\(dateFormat.string(from: date))")
                    }
                }
                Section(header: Text("APARIENCIA")) {
                    ColorPicker("Color del fondo", selection: $backgroundColor)
                    ColorPicker("Color de letra", selection: $fontColor)
                    ColorPicker("Color de contorno imágen", selection: $imageColor)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .principal) {
                    HStack {
                        Image(systemName: "gearshape.fill")
                        Text("Configuración").font(.headline)
                    }
                    .foregroundColor(.red)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .background(profileBackgroundColor)
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
            .onDisappear {
                UITableView.appearance().backgroundColor = .systemGroupedBackground
            }
        }
        .accentColor(.red)
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
    @State static var imageColor: Color = Color(.red)
    @State static var activo: Bool = false
    @State static var modalidad: String = "Remoto"
    
    static var previews: some View {
        ProfileDataView(name: $name, city: $city, email: $email, id: $id, date: $date, backgroundColor: $backgroundColor, fontColor: $fontColor, imageColor: $imageColor, activo: $activo, modalidad: $modalidad)
    }
}
