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
                    
                    TextField("Text6", text: $numberOnly.goalBalancevalue).alert(isPresented: $showAddCardAlert, content: {
                        Alert(title:Text("You need to fill your Target goal !"))
                    })
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                       // .placeholder(when: numberOnly.goalBalancevalue.isEmpty) {
//                    Text("Target Goal")
//                   .foregroundColor(.blue)
//                   .bold()
                 //   }
                }.padding()
                  
                        VStack(alignment: .leading){
                            Text("Text7")
                            TextField("Text9", text: $numberOnly.monthsvalue)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                        }.padding()
                VStack(alignment: .center){
                    
                    Button("Text21", action: {
                        if validateTex(){
                         
                                let goalAmount: Int = Int(numberOnly.goalBalancevalue) ?? 0
                                let monthInt: Int = Int(numberOnly.monthsvalue) ?? 2
                          
                                goalVM.addCardGoal(goalName: name, goalBalance:  goalAmount, months:monthInt)
                            
                                name = ""
                                numberOnly.monthsvalue = ""
                                numberOnly.goalBalancevalue = ""
                                prezsentationMode.wrappedValue.dismiss()
                        }else{
                            showAddCardAlert = true
                            
                        }
                       
                    }).alert("You need to fill your Target goal !", isPresented: $showAddCardAlert){
                        Button("OK", role: .cancel) { }
                    }
                  //  .disabled(numberOnly.goalBalancevalue.isEmpty)
                    .modifier(Items.ButtonModifier()) }
              
                   

                }
        
            }
            
        }
    func validateTex() -> Bool{
        
        if !numberOnly.goalBalancevalue.isEmpty {
            return true
        }
        return false
    }
        
        
    }




struct AddGoalSheet_Previews: PreviewProvider {
    static var previews: some View {
        let goalVM:GoalCardViewModel = GoalCardViewModel()
        AddGoalSheet().environmentObject(goalVM)
    }
}

extension View {
    func placeholder<Content: View> ( when shouldShow: Bool,
   alignment: Alignment = .leading,
                                      
 @ViewBuilder placeholder: () -> Content) -> some View {
   ZStack(alignment: alignment) {
     placeholder().opacity(shouldShow ? 1 : 0)
         self
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
