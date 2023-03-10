//
//  BottomSheetView.swift
//  Balard
//
//  Created by Amaal Almutairi on 17/06/1444 AH.
//

import SwiftUI

struct BottomSheetView: View {
    @EnvironmentObject var goalVM:GoalCardViewModel
    //    var goalCard:GoalCards
    //    @Binding var showingBottomSheet:Bool
    @State var progressValue: Float
    @Environment(\.presentationMode) var presentationMode
    let goalCards:GoalCards
    
    @State var otheramount = ""
    @StateObject var numberOnly:NumbersOnly = NumbersOnly()
    
    var convertProgressToPersantage:Float {
        goalCards.balance == 0 ? 0: Float(goalCards.balance) / Float(goalCards.goalBalance)
    }
    
    
    //    init(totalAmount:Int64, monthValue:Int64, totalAmountGoal:Int64){
    //        self.totalAmount = totalAmount
    //    }
    //    @State var dataArray : [String] = [] //create array to save the amounts tha the user will enter
    
    var body: some View{
        
        VStack{
            VStack{
                HStack{
                    Image(systemName: "dollarsign.circle")
                        .font(.system(size: 24))
                        .foregroundColor(Color("lightGreen"))
                    Text("Text15")
                        .multilineTextAlignment(.leading)
                }
                Section{
                    TextField("Text22" , text: $otheramount)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 351,height: 51)
                        .padding(.bottom,20)
                }
                
            }
            Button{
                let otheramountInt: Int = Int(otheramount) ?? 0
                goalVM.AddAmount(balance: otheramountInt, goalCard: goalCards, progress: convertProgressToPersantage) // call the function to add and save the amount
                otheramount = ""
                goalVM.getCard()
                if goalCards.balance > goalCards.goalBalance {
                    goalCards.balance = goalCards.goalBalance
                    goalCards.progress = convertProgressToPersantage
                    
                    //    Float(Double(goalCard.balance )) // increment 10% each time press the button
                }
                presentationMode.wrappedValue.dismiss()
            }label: {
                Text("Text8")
                    .frame(width:281 , height:41 )
                    .foregroundColor(.white)
                    .background(Color("lightBlue"))
                    .border(.gray)
                    .cornerRadius(8)
                    .fontWeight(.semibold)
            }
            
            
        }
        //        Button {
        //            let otheramountInt: Int = Int(otheramount) ?? 2
        //
        //            goalVM.editBalance(goalCard: goalCards, balance: otheramountInt, progress: convertProgressToPersantage)
        //            otheramount = ""
        ////            NavigationLink("", destination: editAmount(goalCards: goalCards))
        //        } label: {
        //            Text("edit")
        //        }
        
    }
    
}


//struct BottomSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        let BottomSheetVM = GoalCardViewModel()
//
//        ProgressPage()
//            .environmentObject(BottomSheetVM)
//    }
//}









/*
 
 */
