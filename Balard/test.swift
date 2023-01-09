//
//  test.swift
//  Balard
//
//  Created by Amaal Almutairi on 16/06/1444 AH.
//

import SwiftUI

struct test: View {
    @State private var progress = 0.75
    @EnvironmentObject var cardCustomVM: GoalCardViewModel
    //    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.presentationMode) var presentationMode
    @State var presentCardGoalView = false
    
    var body: some View {
        VStack{
            
            
            // ForEach(cardCustomVM.goalCards, id: \.self) { goalCard in
            ZStack{
                Color("darkBlue")
                    .background()
                    .modifier(Items.CardShapModifier())
                
                
                VStack{
                    HStack(alignment: .center){
                        Text( "No goal").foregroundColor(.white).padding(.trailing).padding(.bottom)
                        Spacer()
                        VStack(alignment: .trailing){
                            Text( "goalBalance")
                            Text("Balance")
                                .modifier(Items.TextStyleModifier())
                                .padding(.trailing)
                        }.modifier(Items.TextStyleModifier())
                      // Spacer()
    //                        .padding(.horizontal,5)
                      
                      
                    } .modifier(Items.TextStyleModifier()) .padding()
                 
                    HStack{
                        ProgressView(value: progress) {
                        }   .modifier(Items.TextStyleModifier())
                        
                        Text("\(String(format: "%.0f%%", progress * 100))").foregroundColor(.white).padding(.bottom)
                           
                        
                        
                    }
                    HStack{
                        Button {
                            
                        } label: {
                            Text("View More")
                            Spacer()
                            Image(systemName: "arrow.forward")
                        }
                        
                    }.padding(.leading).padding(.trailing).padding(.bottom).foregroundColor(.white)
                
                }
            
            
               // Spacer()
                // VStack(alignment: .leading){
    
                
                // }
           
                Divider().foregroundColor(.gray).fontWeight(Font.Weight.medium)
                
            }.frame(width: 328, height: 168)
            //  }
            
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        let cardCustomVM = GoalCardViewModel()
        test() .environmentObject(cardCustomVM)
        
    }
}
