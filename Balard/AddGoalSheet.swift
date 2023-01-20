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
    @State var showAddCardAlert = false
    @StateObject var numberOnly:NumbersOnly = NumbersOnly()
    @EnvironmentObject var goalVM:GoalCardViewModel
    @Environment(\.presentationMode) var prezsentationMode
    @State var isValidText = false
    
    var body: some View {
        Form{
            VStack(alignment: .center){
                VStack(alignment: .leading){
                    
                    Text("Text3")
                    TextField("Text4", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    
                } .padding()
                VStack(alignment: .leading){
                    Text("Text5")
                    // Text("You need to fill your Target goal !")
                    TextField("Text6", text: $numberOnly.goalBalancevalue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                  
                        VStack(alignment: .leading){
                            Text("Text7")
                            TextField("Text9", text: $numberOnly.monthsvalue)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                        }.padding()
                VStack(alignment: .center){
                    Button("Text21", action: {
                        if !goalBalance.isEmpty {
                            let goalAmount: Int = Int(numberOnly.goalBalancevalue) ?? 0
                            let monthInt: Int = Int(numberOnly.monthsvalue) ?? 2
                            goalVM.addCardGoal(goalName: name, goalBalance:  goalAmount, months:monthInt)
                            name = ""
                            numberOnly.monthsvalue = ""
                            numberOnly.goalBalancevalue = ""
                            prezsentationMode.wrappedValue.dismiss()
                            
                        }
                    }).modifier(Items.ButtonModifier()) }
              
                   

                }
        
            }
            
        }
        
        
        
    }


/*
 .alert("List Name", isPresented: $showAddCardAlert, actions: {
     Button("Text21", action: {
         let goalAmount: Int = Int(numberOnly.goalBalancevalue) ?? 0
         let monthInt: Int = Int(numberOnly.monthsvalue) ?? 2
         
         if !goalBalance.isEmpty {
             goalVM.addCardGoal(goalName: name, goalBalance:  goalAmount, months:monthInt)
             name = ""
             numberOnly.monthsvalue = ""
             numberOnly.goalBalancevalue = ""
             prezsentationMode.wrappedValue.dismiss()
             
         }
     }).modifier(Items.ButtonModifier())
     Button("Cancel", role: .cancel, action: {})
 } , message: {
     Text("Please enter the name of list.")
 })
 
 //                        Text(" \(goalBalance.isEmpty ? "You need to fill your Target goal !" : "" )")
 ////                        Text("\("You need to fill your Target goal !")")
 ////                            .foregroundColor(Color.red).font(.caption)
 //                    }
 */

struct AddGoalSheet_Previews: PreviewProvider {
    static var previews: some View {
        let goalVM:GoalCardViewModel = GoalCardViewModel()
        AddGoalSheet().environmentObject(goalVM)
    }
}
