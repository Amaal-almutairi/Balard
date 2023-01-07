//
//  Items.swift
//  Balance-Guard
//
//  Created by Amaal Almutairi on 13/06/1444 AH.
//

import SwiftUI

struct Items: View {
    struct AddGoalBtnModifier: ViewModifier {
        
        func body(content: Content) -> some View {
            content
            .frame(width: 122,height: 33)
            .background(.white)
            .cornerRadius(10)
        }
    }
    struct ButtonModifier: ViewModifier {
        
        func body(content: Content) -> some View {
            content
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 41)
                .background(Color.gray.opacity(0.1))
                .background(Color("lightBlue"))
                .cornerRadius(20)
                .padding()
        }
    }
    struct CardShapModifier: ViewModifier {
        
        func body(content: Content) -> some View {
            content
                .frame(width: 328, height: 168)
//                .background(Color("darkBlue"))
                .cornerRadius(20)
//                .foregroundColor(.white)
        }
    }
    
    struct TextFieldModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.headline)
                .lineLimit(1)
                .padding()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            
        }
    }
    struct TextStyleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.headline)
                .foregroundColor(.white)
            
        }
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Items_Previews: PreviewProvider {
    static var previews: some View {
        Items()
    }
}
