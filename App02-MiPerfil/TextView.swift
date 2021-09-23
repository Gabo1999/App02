//
//  TextView.swift
//  App01-MiPerfil
//
//  Created by David Cantú Delgado on 20/09/21.
//

import SwiftUI

struct TextView: View {
    
    var text: String
    var image: String
    var font: String
    var size: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)
                .font(.Gluten(style: font, size: size))
                .foregroundColor(Color("Font"))
                .padding()
            Spacer()
        }
        .padding(.leading,60)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "David Cantú Delgado", image: "person.fill", font: "Regular", size: 28)
    }
}
