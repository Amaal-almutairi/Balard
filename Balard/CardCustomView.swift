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
    @State private var progress:Float = 0.00
    @EnvironmentObject var goalVM: GoalCardViewModel
    @Environment(\.presentationMode) var prezsentationMode
    @State var presentProgressView = false
    @State  var showCardGoalView = false
    var convertProgressToPersantage:Float {
        goalCard.balance == 0 ? 0: Float(goalCard.balance) / Float(goalCard.goalBalance)
    }
    var body: some View {
        VStack{
            ZStack{
                Color("darkBlue")
                    .background()
                    .modifier(Items.CardShapModifier())
                VStack(alignment: .trailing){
                    HStack{
                        Text(goalCard.name ?? "Text19")
                            .font(.system(size:30 , weight: .medium))
                            .accessibilityLabel("Your goal")
                            .accessibilityValue(goalCard.name ?? "your goal")
                            .accessibilityHint("Add your goal")
                        Spacer()
                        Text("\(goalCard.goalBalance)")
                            .font(.system(size:21 , weight: .regular))
                            .accessibilityLabel("Target Goal")
                            .accessibilityValue(String(goalCard.goalBalance ))
                        
                    }
                    VStack{
                        Text("\(goalCard.balance)")
                            .font(.system(size:16 , weight: .regular))
                            .foregroundColor(Color("ourgrey"))
                            .accessibilityLabel("You saved")
                            .accessibilityValue(String(goalCard.balance ))
                        
                    }
                    HStack(alignment: .center){
                        
                        ProgressView(value:convertProgressToPersantage) {
                        }   .modifier(Items.TextStyleModifier())
                        Text("\(String(format: "%.0f%%", convertProgressToPersantage*100))")
                        
                           // .accessibilityValue("\(String(format: "%.0f%%", progress * 100))")
                            .foregroundColor(.white).onAppear(){
                                
                               print(convertProgressToPersantage)
                            }
//                            .onAppear(){
//                                goalCard.progress = 0.00
//                            }
//                            .onAppear(){
//                                goalCard.progress = 0.00
//                                if goalCard.balance > goalCard.goalBalance {
//                                    goalCard.balance = goalCard.goalBalance
//                                    goalCard.progress = convertProgressToPersantage
//                                //    Float(Double(goalCard.balance )) // increment 10% each time press the button
//                                }else{
//                                    convertProgressToPersantage // increment 10% each time press the button
//                                    goalCard.progress -= 1.0
//
//                                   // if (progress) < 1.0{
//
//                                 //   }else {
//                                       // goalCard.progress += Float(Int(Double(goalCard.balance )))
//                                   // }
//
//                                }
//                            }
//                            .onAppear(){
//                                goalCard.progress = 0.00 //intial value 30%
//                                if (goalCard.progress) > goalCard.goalBalance {
//                                    goalCard.balance = goalCard.goalBalance
//                                    self.progress = convertProgressToPersantage
//                                }else {
//                                    goalCard.progress += Float(goalCard.balance / 100) // increment 10% each time press the button
//
//                                    goalCard.progress -= 1.0 //when it reach tghe value will not increment
//                                }
//                            }
                    }
                    Divider().foregroundColor(.gray).fontWeight(Font.Weight.medium)
                    
                    NavigationLink {
                        ProgressPage(goalCard: goalCard)
                    } label: {
                        Text("Text13")
                            .foregroundColor(Color("ourgrey"))
                    }
                    
                    
                }.padding(.leading).padding(.trailing)
            }.frame(width: 328, height: 168).foregroundColor(.white)
        }
        .fullScreenCover(isPresented: $presentProgressView){
            ProgressPage( goalCard: goalCard)
            
        }
    }
    
}

//struct CardCustomView_Previews: PreviewProvider {
//    static var previews: some View {
//        let cardCustomVM = GoalCardViewModel()
//        //        CardCustomView(goalCard: GoalCards(entity: [], insertInto: cardCustomVM.goalCards)).environmentObject(cardCustomVM)
//    }
//}






