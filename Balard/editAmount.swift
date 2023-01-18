////
////  editAmount.swift
////  Balard
////
////  Created by Amaal Almutairi on 24/06/1444 AH.
////
//
//import SwiftUI
//
//
//
//struct editAmount:View {
//    
//    @EnvironmentObject var goalVM:GoalCardViewModel
//    var goalCards:GoalCards
//    @State var progressValue: Float
//    @Environment(\.presentationMode) var presentationMode
//    
//    @State var otheramount = 2
//    @StateObject var numberOnly:NumbersOnly = NumbersOnly()
//
//    var convertProgressToPersantage:Float {
//       goalCards.balance == 0 ? 0: Float(goalCards.balance) / Float(goalCards.goalBalance)
//   }
//  
//    var body: some View{
//        
//            VStack{
//                HStack{
//                    Image(systemName: "dollarsign.circle")
//                        .font(.system(size: 24))
//                        .foregroundColor(Color("lightGreen"))
//                    Text("Text15")
//                        .multilineTextAlignment(.leading)
//                }
//                Section{
//                    TextField("\(goalCards.balance)" , text: $numberOnly.balanceValue)
//                        .textFieldStyle(.roundedBorder)
//                        .frame(width: 351,height: 51)
//                        .padding(.bottom,20)
//                }
//                
//            }
//            Button{
//                presentationMode.wrappedValue.dismiss()
//                let otheramountInt: Int = Int(otheramount)
//                goalVM.editBalance(goalCard: goalCards, balance: otheramountInt, progress: convertProgressToPersantage)
//                numberOnly.balanceValue = ""
//
//                if goalCards.balance > goalCards.goalBalance {
//                    goalCards.balance = Int64(Int(goalCards.goalBalance))
//                    goalCards.progress = convertProgressToPersantage
//                //    Float(Double(goalCard.balance )) // increment 10% each time press the button
//                }
//            }label: {
//                Text("edit")
//                    .frame(width:281 , height:41 )
//                    .foregroundColor(.white)
//                    .background(Color("lightBlue"))
//                    .border(.gray)
//                    .cornerRadius(8)
//                    .fontWeight(.semibold)
//            }
//            .onAppear(){
//                otheramount = Int(goalCards.balance)
//               // goalAmount = Int(goalCards.balance)
//
//            }
//        }
//       
//    }
//
//
////
////struct editAmount_Previews: PreviewProvider {
////    static var previews: some View {
////        editAmount(goalCards: goalCards)
////    }
////}
