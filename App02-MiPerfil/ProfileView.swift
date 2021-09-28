//
//  ContentView.swift
//  App02-MiPerfil
//
//  Created by David Josué Marcial Quero on 20/09/21.
//

import SwiftUI

struct ProfileView: View {
    
    @State var name: String = "David Josué Marcial Quero"
    @State var city: String = "Oaxaca"
    @State var email: String = "A00828702@itesm.mx"
    @State var id: String = "A00828702"
    @State var date: Date = Date()
    @State var showData: Bool = false
    @State var backgroundColor: Color = Color("Background")
    @State var fontColor: Color = Color(.black)
    
    // Variable para darle formate a las variables tipo fecha
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                Text("Mi Perfil")
                    .modifier(TitleModifier())
                    .padding(.bottom,20)
                    .padding(.top,80)
                Image("profile2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:300)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 6)
                            .foregroundColor(Color("Title"))
                    )
                    .padding(.vertical,60)
                
                TextView(text: name, image: "person.fill", font: "Black", size:24, fontColor: fontColor)
                TextView(text: city, image: "house.fill", font: "Regular", size:24, fontColor: fontColor)
                TextView(text: email, image: "envelope.fill", font: "Regular", size:24, fontColor: fontColor)
                TextView(text: id, image: "qrcode", font: "Regular", size:24, fontColor: fontColor)
                HStack {
                    Image(systemName: "calendar")
                    Text("\(dateFormat.string(from: date))")
                        .font(.Roboto(style: "Regular", size: 24))
                        .foregroundColor(fontColor)
                        .padding()
                    Spacer()
                }
                .padding(.leading, 60)
                Button(action: {
                    showData.toggle()
                }, label: {
                    Text("Editar Datos")
                        .font(.Roboto(style: "Bold", size: 40))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(20)
                })
                .padding(.top, 20)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showData) {
            ProfileDataView(name: $name, city: $city, email: $email, id: $id, date: $date, backgroundColor: $backgroundColor, fontColor: $fontColor)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView()
                .preferredColorScheme(.light)
            ProfileView()
                .preferredColorScheme(.dark)
        }
    }
}
