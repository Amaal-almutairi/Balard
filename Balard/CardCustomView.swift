//
//  CardCustomView.swift
//  Balard
//
//  Created by Amaal Almutairi on 14/06/1444 AH.
//

import SwiftUI
import CoreData

struct CardCustomView: View {
    
    let goalCard: GoalCards
    @State private var progress:Float = 0.75
    @EnvironmentObject var goalVM: GoalCardViewModel
    @Environment(\.presentationMode) var prezsentationMode
    @State var presentProgressView = false
    @State  var showCardGoalView = false
//    @State var totalAmount =
    var body: some View {
        VStack{
                ZStack{
                    Color("darkBlue")
                        .background()
                        .modifier(Items.CardShapModifier())
                    VStack(alignment: .trailing){
                        HStack{
                            Text(goalCard.name ?? "No goal")
                               // .modifier(Items.TextStyleModifier())
                                .font(.system(size:30 , weight: .medium))
                                .accessibilityLabel("Your goal")
                                .accessibilityValue(goalCard.name ?? "your goal")
                                .accessibilityHint("Add your goal")
                            Spacer()
                            Text(goalCard.goalBalance ?? "goalBalance")
                                //.modifier(Items.TextStyleModifier())
                                .font(.system(size:21 , weight: .regular))
                                .accessibilityLabel("goalBalance")
                                .accessibilityValue(String(goalCard.name ?? "goalBalance"))
                              
                        }
                        VStack{
                            Text("\(goalCard.balance)")
                                //.modifier(Items.TextStyleModifier())
                                .font(.system(size:16 , weight: .regular))
                                .foregroundColor(Color("ourgrey"))
                                .accessibilityLabel("goalBalance")
                                .accessibilityValue(String(goalCard.name ?? "No balance"))
                              
                        }
                        HStack(alignment: .center){
                            ProgressView(value: progress) {
                            }   .modifier(Items.TextStyleModifier())
                            Text("\(String(format: "%.0f%%", progress * 100))")
                                .accessibilityValue("\(String(format: "%.0f%%", progress * 100))")
                                .foregroundColor(.white)
                               
                                    .onAppear(){
                                        self.progress = 0.00 //intial value 30%
                                        if (progress) < 1.0{
                                            self.progress += 0.10 // increment 10% each time press the button
                                        }else {
                                            progress -= 1.0 //when it reach tghe value will not increment
                                        }
                                    }
                        }
                        Divider().foregroundColor(.gray).fontWeight(Font.Weight.medium)
                    
                        NavigationLink {
                            ProgressPage(goalCard: goalCard, goalCards: goalCard)
                        } label: {
                            Text("View More")
                        }

                        
                    }.padding(.leading).padding(.trailing)
                }.frame(width: 328, height: 168).foregroundColor(.white)
        }
        .fullScreenCover(isPresented: $presentProgressView){
            ProgressPage( goalCard: goalCard, goalCards: goalCard)
           
        }
    }
    
    
    
    
//    func totalAmount(total:Int) -> Int{
//       return total
//    }
}




struct CardCustomView_Previews: PreviewProvider {
    static var previews: some View {
        let cardCustomVM = GoalCardViewModel()
//        CardCustomView(goalCard: GoalCards(entity: [], insertInto: cardCustomVM.goalCards)).environmentObject(cardCustomVM)
  }
}













// VStack{
// ForEach(cardCustomVM.goalCards, id: \.self) { goalCard in
//     ZStack{
//         Color("darkBlue")
//             .background()
//             .modifier(Items.CardShapModifier())
//
//         HStack(alignment: .top){
//             Text(goalCard.name ?? "No goal").foregroundColor(.white)
//             //  Spacer()
//
//             VStack(alignment: .trailing){
//                 Text( goalCard.goalBalance ?? "goalBalance").foregroundColor(.white)
//                 Text(goalCard.balance ?? "No balance")
//                     .modifier(Items.TextStyleModifier())
//                     .padding(.bottom)
//                 //.padding(.trailing)
//                 //.padding(.bottom)
//                 //  Spacer()
//                 //                                         VStack(alignment: .trailing){
//                 //
//                 //
//                 //                                                // .padding(.trailing)
//                 //                                         }.modifier(Items.TextStyleModifier())
//                 // Spacer()
//                 //                        .padding(.horizontal,5)
//
//
//                 //.padding()
//                 //.padding(.bottom)
//                 //                                         VStack(alignment: .trailing){
//                 //
//                 //                                         }.frame(width: 300, height: 20).padding()
//
//                 HStack(alignment: .center){
//                     ProgressView(value: progress) {
//                     }   .modifier(Items.TextStyleModifier())
//
//                     Text("\(String(format: "%.0f%%", progress * 100))").foregroundColor(.white).padding(.bottom)
//                         .onAppear(){
//                             self.progress = 0.00 //intial value 30%
//                             if (progress) < 1.0{
//                                 self.progress += 0.10 // increment 10% each time press the button
//                             }else {
//                                 progress -= 1.0 //when it reach tghe value will not increment
//                             }
//                         }
//
//
//                 }
//                 //.frame(width: 300, height: 20)
//                 HStack(alignment: .center){
//                     Button {
//                         presentProgressView = true
//                         showCardGoalView = false
//                     } label: {
//                         HStack{
//                             Text("View More")
//                             Spacer()
//                             Image(systemName: "arrow.forward")
//                         }
//                     }
//
//                 }.foregroundColor(.white)
//                 //  .frame(width: 300, height: 20)
//
//                 //.padding(.leading).padding(.trailing).padding(.bottom).foregroundColor(.white)
//
//             }
//
//         }
//         // Spacer()
//         // VStack(alignment: .leading){
//
//
//         // }
//
//         //                                 Divider().foregroundColor(.gray).fontWeight(Font.Weight.medium)
//
//     }.frame(width: 328, height: 168)
 //}
 
// .onDelete(perform:cardCustomVM.deleteCard)
//}
