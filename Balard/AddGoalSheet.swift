//
//  AddGoalSheet.swift
//  Balard
//
//  Created by Amaal Almutairi on 17/06/1444 AH.
//

import SwiftUI

struct AddGoalSheet: View {
    @State var name = ""
    @State var goalBalance = ""
    @State var months = ""
    @StateObject var numberOnly:NumbersOnly = NumbersOnly()
    @EnvironmentObject var goalVM:GoalCardViewModel
//    @State private var showAddGoalSheet = false
    @Environment(\.presentationMode) var prezsentationMode
  
//    @State var presentCardGoalView = false
    
    var body: some View {
        Form{
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Text3")
                    TextField("Text4", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //  .modifier(Items.TextFieldModifier())
                } .padding()
                VStack(alignment: .leading){
                    Text("Text5")
                    TextField("Text6", text: $numberOnly.goalBalancevalue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //.modifier(Items.TextFieldModifier())
                }.padding().keyboardType(.decimalPad)
                VStack(alignment: .leading){
                    Text("Text7")
                    TextField("Text9", text: $numberOnly.monthsvalue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //.modifier(Items.TextFieldModifier())
                }.padding().keyboardType(.numberPad)
                Button("Text21") {
                    let goalAmount: Int = Int(numberOnly.goalBalancevalue) ?? 0
                    let monthInt: Int = Int(numberOnly.monthsvalue) ?? 0

                    goalVM.addCardGoal(goalName: name, goalBalance:  goalAmount, months:monthInt)
                    goalVM.getCard()
                    name = ""
                    numberOnly.goalBalancevalue = ""
                    numberOnly.monthsvalue = ""
                    prezsentationMode.wrappedValue.dismiss()
//                    presentCardGoalView = true
//                    showAddGoalSheet.toggle()

                    
                    print("add new goal")
                  // presentCardGoalView.toggle()
                    // CardCustomView()
                    //showAddGoalSheet = false
                }.modifier(Items.ButtonModifier())
            }
            
        }
    }
}

struct AddGoalSheet_Previews: PreviewProvider {
    static var previews: some View {
        let goalVM:GoalCardViewModel = GoalCardViewModel()
        AddGoalSheet().environmentObject(goalVM)
    }
}
