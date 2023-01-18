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
    @State var frameSize: CGFloat = UIScreen.main.bounds.width - 50 // display the content in all iphones in the same size(width only)
    var convertProgressToPersantage:Float {
        goalCard.balance == 0 ? 0: Float(goalCard.balance) / Float(goalCard.goalBalance)
    }
    var body: some View {
        VStack{
            ZStack{
                Color("darkBlue")
                    .background()
                    .modifier(Items.CardShapModifier())
                    .frame(width: frameSize , height: 180)// height: 173
              
               
                VStack(alignment: .trailing){
                    HStack{
                        Text(goalCard.name ?? "Text19")
                            .font(.system(size:30 , weight: .medium))
                            .accessibilityLabel("Text24")
                            .accessibilityValue(goalCard.name ?? "Text24")
                            .accessibilityHint("Text25")
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(goalCard.goalBalance)")
                            .font(.system(size:21 , weight: .regular))
                            .accessibilityLabel("Text27")
                            .accessibilityValue(String(goalCard.goalBalance ))
                            .foregroundColor(.white)
                     
                    }
                    VStack{
                        Text("\(goalCard.balance)")
                            .font(.system(size:16 , weight: .regular))
                            .foregroundColor(Color("ourgrey"))
                            .accessibilityLabel("Text26")
                            .accessibilityValue(String(goalCard.balance ))
                            .padding(.bottom)
                    }
                    HStack(alignment: .center){
                        
                        ProgressView(value:convertProgressToPersantage) {
                        }   .modifier(Items.TextStyleModifier())
                        Text("\(String(format: "%.0f%%", convertProgressToPersantage*100))")
                        
                           // .accessibilityValue("\(String(format: "%.0f%%", progress * 100))")
                            .foregroundColor(.white).onAppear(){
                                
                               print(convertProgressToPersantage)
                            }
                            .onAppear(){
                                goalVM.getCard()
                            }
//                            .onAppear(){
//                            
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
                    
                    
                }.padding(.leading).padding(.trailing).padding(.top)
            }
            
            //.frame(width: frameSize)
            
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






