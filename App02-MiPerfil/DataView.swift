//
//  DataView.swift
//  App01-MiPerfil
//
//  Created by Alumno on 23/09/21.
//

import SwiftUI

struct DataView: View {
    @Binding var counter: Int
    @Binding var colour: Bool
    
    var body: some View {
        VStack {
            Text("Counter: \(counter)")
                .font(.Gluten(style: "Bold", size: 40))
                .padding(.bottom, 20)
            Button(action: {
                counter += 1
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            })
            Button(action: {
                colour.toggle()
                counter += 1
            }, label: {
                Text("Background")
                    .font(.Gluten(style: "Bold", size: 40))
                    .foregroundColor(.white)
                    .padding()
                    .background(colour ? Color.purple : Color.blue)
                    .cornerRadius(20)
            })
            .padding(.top, 20)
        }
    }
}

struct DataView_Previews: PreviewProvider {
    @State static var counter: Int = 0
    @State static var colour: Bool = false
    
    static var previews: some View {
        DataView(counter: $counter, colour: $colour)
    }
}
