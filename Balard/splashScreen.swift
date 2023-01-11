//
//  splashScreen.swift
//  medtik1
//
//  Created by Amaal Almutairi on 28/05/1444 AH.
//

import SwiftUI

struct splashScreen: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
           ContentView()
        } else {
            ZStack{
                Color("lightGray")
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Image("logo")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 150,height: 150)
                        Text("BALARD")
                            .font(.system(size:48 ,weight: .medium))
                            .foregroundColor(Color("darkBlue"))
                    }
                    
                    .scaledToFit()
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
    
}


struct splashScreen_Previews: PreviewProvider {
    static var previews: some View {
        splashScreen()
    }
}
