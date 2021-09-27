//
//  StateView.swift
//  App01-MiPerfil
//
//  Created by David Josué Marcial Quero on 23/09/21.
//

import SwiftUI

struct StateView: View {
    
    @State var counter: Int = 0
    @State var colour: Bool = false
    @State var showView: Bool = false
    
    var body: some View {
        ZStack {
            colour ? Color.blue : Color.purple
            VStack {
                Text("Counter: \(counter)")
                    .font(.Roboto(style: "Bold", size: 40))
                    .padding(.bottom, 20)
                Button(action: {
                    counter += 1
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                })
                Button(action: {
                    colour.toggle()
                    counter += 10
                }, label: {
                    Text("Background")
                        .font(.Roboto(style: "Bold", size: 40))
                        .foregroundColor(.white)
                        .padding()
                        .background(colour ? Color.purple : Color.blue)
                        .cornerRadius(20)
                })
                .padding(.top, 20)
                Button(action: {
                    showView.toggle()
                }, label: {
                    Text("Open")
                        .font(.Roboto(style: "Bold", size: 40))
                        .foregroundColor(.white)
                        .padding()
                        .background(colour ? Color.purple : Color.blue)
                        .cornerRadius(20)
                })
                .padding(.top, 20)
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .sheet(isPresented: $showView, content: {
            DataView(counter: $counter, colour: $colour)
        })
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
