//
//  CardCustomView.swift
//  Balance-Guard
//
//  Created by Amaal Almutairi on 13/06/1444 AH.
//

import SwiftUI
import CoreData

struct CardCustomView: View {
    @State private var progress = 0.75
    @EnvironmentObject var cardCustomVM:GoalCardViewModel
    var body: some View {
        VStack{
            ZStack{
                Color("darkBlue")
                .modifier(Items.CardShapModifier())
            }
            List{
                ForEach(cardCustomVM.goalCards, id: \.self){ CardGoal in
                    Text(CardGoal.name ?? "No goal")
                   .modifier(Items.TextStyleModifier())
                }
            }
        }
        
//  VStack{
//        ZStack{
//            Color("darkBlue")
//                .modifier(Items.CardShapModifier())
//
//            ForEach(cardCustomVM.goalCards, id: \.self) { goalCard in
//                HStack{
//                    Text(goalCard.name ?? "No goal")
//                        .modifier(Items.TextStyleModifier())
//                    Spacer()
//                    VStack{
//                        Text(goalCard.goalBalance ?? "No balanceGoal")
//                        Text(goalCard.balance ?? "No balance")
//                    }   .padding(.top,30).padding(.trailing)
//
//                } .padding(.leading) .padding(.top,20)
//                //  Spacer()
//                HStack{
//                    ProgressView(value: progress) {
//                    }
//                    Text("\(String(format: "%.0f%%", progress * 100))")
//
//
//                }.padding()
//                Divider()
//                VStack(alignment: .leading){
//                    HStack{
//                        Button {
//
//                        } label: {
//                            Text("View More")
//                            Spacer()
//                            Image(systemName: "arrow.forward")
//                        }
//
//                    }.padding().padding(.bottom,30)
//
//                }
//            }
//        }
//        }
        }
    }


struct CardCustomView_Previews: PreviewProvider {
    static var previews: some View {
        CardCustomView()
            .environmentObject(GoalCardViewModel())
    }
}
