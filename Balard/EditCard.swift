//
//  EditCard.swift
//  Balard
//
//  Created by Amaal Almutairi on 24/06/1444 AH.
//

import SwiftUI

struct EditCard: View {
    @Environment(\.presentationMode) var dismiss
    @EnvironmentObject var goalVM:GoalCardViewModel
    @StateObject var numberOnly:NumbersOnly = NumbersOnly()
    let goalCard: GoalCards
    @State var name = ""
    @State var goalBalance = ""
    @State var months = ""
    
    var body: some View {
        Form{
           
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Text3")
                        TextField("\(goalCard.name ?? "")", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } .padding()
                    VStack(alignment: .leading){
                        Text("Text5")
                        
                        TextField("\(goalCard.goalBalance )", text: $numberOnly.goalBalancevalue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding()
                    VStack(alignment: .leading){
                        Text("Text7")
                        TextField("\(goalCard.months )" , text: $numberOnly.monthsvalue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding()
                    Button("Save") {
                        let goalAmount: Int = Int(numberOnly.goalBalancevalue) ?? 1
                        let monthInt: Int = Int(numberOnly.monthsvalue) ?? 2
                        
                        goalVM.editGoal(goalCard: goalCard, goalName: name, goalBalance: goalAmount, months: monthInt)
                        
                        name = ""
                        numberOnly.goalBalancevalue = ""
                        numberOnly.monthsvalue = ""
                        dismiss.wrappedValue.dismiss()
                        print("add new goal")
                    }.modifier(Items.ButtonModifier())
                }
                
               
            
        }
    
      
    }
}


//struct EditCard_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCard()
//    }
//}
