//
//  Fonts.swift
//  App01-MiPerfil
//
//  Created by David Cantú Delgado on 20/09/21.
//

import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Gluten-Regular", size: 20 ))
            .foregroundColor(.white)
    }
}

struct TitleModifier: ViewModifier {
func body(content: Content) -> some View {
    content
        .font(.custom("Gluten-Black", size: 32 ))
        .foregroundColor(Color("Title"))
    }
}

extension Font {
    public static func Gluten(style: String, size: CGFloat) -> Font {
        return Font.custom("Gluten-\(style)", size: size)
    }
}
