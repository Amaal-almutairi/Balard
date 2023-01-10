//
//  ContentView.swift
//  Balance-Guard
//
//  Created by Amaal Almutairi on 13/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddGoalSheet = false
  
    @Environment(\.presentationMode) var dismiss
    @State var presentCardGoalView = false
    
    //    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var goalVM:GoalCardViewModel
    
    
    
    var body: some View {
      NavigationView {
            VStack{
                VStack{
                    
                    if goalVM.goalCards.isEmpty {
                        Text("No Goals Tap  ‘Add Goal’  to start saving your money  and achive your goals").lineLimit(nil)
                        
                    }else{
                        Form {
                            ForEach(goalVM.goalCards, id: \.id) {cardGoal in
                                CardCustomView(goalCard: cardGoal)
                            } .onDelete(perform:goalVM.deleteCard)
                            
                            // .environmentObject(goalVM)
                            
                        }
                    }
                    
                }  .navigationBarTitle(Text("Explore"))
                    .navigationBarItems(trailing:
                                            HStack {
                        Image(systemName: "plus")
                            .foregroundColor(Color("lightGreen"))
                            .padding(.leading)
                        Button("Add Goal") {
                            showAddGoalSheet.toggle()
                        }.foregroundColor(.black).padding(.trailing)
                            .sheet(isPresented: $showAddGoalSheet){
                                AddGoalSheet()
                            }
                    } .modifier(Items.AddGoalBtnModifier())
                    )
                
            }
            .onAppear(){
                goalVM.getCard()
            }
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let goalVM:GoalCardViewModel = GoalCardViewModel()
        ContentView().environmentObject(goalVM)
    }
}
//            ZStack{
//                Color("lightGray")
//                    .ignoresSafeArea()
//                VStack{
//                    Form {
//
//                        ForEach(goalVM.goalCards) {cardGoal in
//                            CardCustomView()
//                        } .onDelete(perform:goalVM.deleteCard)
//                        // .environmentObject(goalVM)
//
//                    }
//                    .navigationBarTitle(Text("Explore"))
//                    .navigationBarItems(trailing:
//                                            HStack {
//                        Image(systemName: "plus")
//                            .foregroundColor(Color("lightGreen"))
//                            .padding(.leading)
//                        Button("Add Goal") {
//                            showAddGoalSheet.toggle()
//                        }.foregroundColor(.black).padding(.trailing)
//                            .sheet(isPresented: $showAddGoalSheet){
//                                Form{
//                                    VStack(alignment: .leading){
//                                        VStack(alignment: .leading){
//                                            Text("Name")
//                                            TextField("Name Of Your Goal", text: $name)
//                                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                            //  .modifier(Items.TextFieldModifier())
//                                        } .padding()
//                                        VStack(alignment: .leading){
//                                            Text("Goal")
//                                            TextField("Add The Goal $", text: $numberOnly.goalBalancevalue)
//                                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                            //.modifier(Items.TextFieldModifier())
//                                        }.padding().keyboardType(.decimalPad)
//                                        VStack(alignment: .leading){
//                                            Text("Months")
//                                            TextField("Add The Month", text: $numberOnly.monthsvalue)
//                                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                            //.modifier(Items.TextFieldModifier())
//                                        }.padding().keyboardType(.numberPad)
//                                        Button("Add") {
//                                           goalVM.addCardGoal(goalName: name, goalBalance:  numberOnly.goalBalancevalue, months:numberOnly.monthsvalue)
//                                            // goalVM.update()
//                                            // goalVM.getCard()
//                                            print("add new goal 2")
//
//                                            name = ""
//                                            goalBalance = ""
//                                            months = ""
//                                            presentCardGoalView = true
//
//                                            // presentCardGoalView.toggle()
//                                            // CardCustomView()
//                                            dismiss.wrappedValue.dismiss()
//                                        }.modifier(Items.ButtonModifier())
//                                    }
//
//                                }
//                            }
//                    } .modifier(Items.AddGoalBtnModifier())
//
//                    )
//                }
//            }
//
//        }
