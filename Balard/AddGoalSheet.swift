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
    @State private var showAddGoalSheet = false
  
    @Environment(\.presentationMode) var dismiss
    @State var presentCardGoalView = false
    
    var body: some View {
        Form{
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Name")
                    TextField("Name Of Your Goal", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //  .modifier(Items.TextFieldModifier())
                } .padding()
                VStack(alignment: .leading){
                    Text("Goal")
                    TextField("Add The Goal $", text: $numberOnly.goalBalancevalue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //.modifier(Items.TextFieldModifier())
                }.padding().keyboardType(.decimalPad)
                VStack(alignment: .leading){
                    Text("Months")
                    TextField("Add The Month", text: $numberOnly.monthsvalue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //.modifier(Items.TextFieldModifier())
                }.padding().keyboardType(.numberPad)
                Button("Create") {
                    goalVM.addCardGoal(goalName: name, goalBalance:  numberOnly.goalBalancevalue, months:numberOnly.monthsvalue)
                    goalVM.getCard()
                    name = ""
                    numberOnly.goalBalancevalue = ""
                    numberOnly.monthsvalue = ""
                    presentCardGoalView = true
                    
                    print("add new goal")
                  // presentCardGoalView.toggle()
                    // CardCustomView()
                    showAddGoalSheet = false
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
