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
    @State var goalBalance = ""
    @State var months = ""
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var contextObject
    @StateObject var goalVM:GoalCardViewModel = GoalCardViewModel()
    
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("lightGray")
                    .ignoresSafeArea()
                ScrollView {
                    CardCustomView()
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
                                            .modifier(Items.TextFieldModifier())
                                    } .padding()
                                    VStack(alignment: .leading){
                                        Text("Goal")
                                        TextField("Add The Goal $", text: $goalBalance)
                                            .modifier(Items.TextFieldModifier())
                                    }.padding().keyboardType(.numberPad)
                                    VStack(alignment: .leading){
                                        Text("Months")
                                        TextField("Add The Month", text: $months)
                                            .modifier(Items.TextFieldModifier())
                                    }.padding().keyboardType(.numberPad)
                                    Button("Add") {
//                                        let goalBalance:Int = Int(goalBalance) ?? 0
//                                        let months:Int = Int(months) ?? 0
                                        goalVM.addCardGoal(goalName: name, goalBalance: goalBalance, months: months)
                                       // goalVM.addCardGoal(goalName: <#T##String#>, goalBalance: <#T##Int16#>, months: <#T##Int16#>)
                                        goalVM.getCard()
                                        presentationMode.wrappedValue.dismiss()
                                        CardCustomView()
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
