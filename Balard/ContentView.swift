//
//  ContentView.swift
//  Balance-Guard
//
//  Created by Amaal Almutairi on 13/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddGoalSheet = false
    @State var name = ""
    @State var goalBalance = "3000"
    @State var months = "3"
    @Environment(\.presentationMode) var dismiss
    @State var presentCardGoalView = false

//    @Environment(\.presentationMode) var presentationMode
//    @Environment(\.managedObjectContext) var contextObject
    @StateObject var goalVM:GoalCardViewModel = GoalCardViewModel()
    @StateObject var numberOnly:NumbersOnly = NumbersOnly()

    
    
    var body: some View {
        NavigationView {
//            if goalVM.goalCards !== nil {
//                CardCustomView()
//            }else{
//                Text("No Goals Tap  ‘Add Goal’  to start saving your money  and achive your goals").lineLimit(nil)
//
//            }
            ZStack{
                Color("lightGray")
                    .ignoresSafeArea()
                Form {
                
                    ForEach(goalVM.goalCards) {cardGoal in
                        CardCustomView()
                    } .onDelete(perform:goalVM.deleteCard)
                        .environmentObject(goalVM)
                       
                }
                .navigationBarTitle(Text("Explore"))
                .navigationBarItems(trailing:
                                        HStack {
                    Image(systemName: "plus")
                        .foregroundColor(Color("lightGreen"))
                        .padding(.leading)
                    Button("Add Goal") {
                        showAddGoalSheet.toggle()
                    }.foregroundColor(.black).padding(.trailing)
                        .sheet(isPresented: $showAddGoalSheet){
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
                                    Button("Add") {
//                                        let goalBalance:Int = Int(goalBalance) ?? 0
//                                        let months:Int = Int(months) ?? 0
                                        goalVM.addCardGoal(goalName: name, goalBalance:  numberOnly.goalBalancevalue, months:numberOnly.monthsvalue)
//                                        goalVM.addCardGoal(goalName: name, goalBalance: Int(goalBalance), months: Int(months))
                                       // goalVM.addCardGoal(goalName: <#T##String#>, goalBalance: <#T##Int16#>, months: <#T##Int16#>)
                                        goalVM.getCard()
                                        presentCardGoalView = true
                                       // presentCardGoalView.toggle()
                                        CardCustomView()
                                        dismiss.wrappedValue.dismiss()
                                    }.modifier(Items.ButtonModifier())
                                }
                                
                            }
                        }
                } .modifier(Items.AddGoalBtnModifier())
                )
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    //
    static var previews: some View {
       // ContentView()
        let goalVM:GoalCardViewModel = GoalCardViewModel()
        ContentView().environmentObject(goalVM)
    }
}
