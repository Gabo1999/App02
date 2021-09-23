//
//  ContentView.swift
//  App01-MiPerfil
//
//  Created by David Cantú Delgado on 20/09/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                Text("Mi Perfil")
                    .modifier(TitleModifier())
                    .padding(.bottom,20)
                    .padding(.top,80)
                Image("profile")
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
                
                TextView(text: "David Cantú Delgado", image: "person.fill", font: "Black", size:24)
                TextView(text: "Monterrey", image: "house.fill", font: "Regular", size:24)
                TextView(text: "david.cantu.delgado", image: "envelope.fill", font: "Regular", size:24)
                TextView(text: "A00189239", image: "qrcode", font: "Regular", size:24)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
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
