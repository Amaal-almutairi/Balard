//
//  ContentView.swift
//  Balance-Guard
//
//  Created by Amaal Almutairi on 13/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddGoalSheet = false
    @State var Name = ""
    @State var GoalBalance = ""
    @State var Months = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject var goalVM:GoalCardViewModel = GoalCardViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("lightGray")
                    .ignoresSafeArea()
                ScrollView {
                    CardCustomView()
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
                                        TextField("Name Of Your Goal", text: $Name)
                                            .modifier(Items.TextFieldModifier())
                                    } .padding()
                                    VStack(alignment: .leading){
                                        Text("Goal")
                                        TextField("Add The Goal $", text: $GoalBalance)
                                            .modifier(Items.TextFieldModifier())
                                    }.padding().keyboardType(.numberPad)
                                    VStack(alignment: .leading){
                                        Text("Months")
                                        TextField("Add The Month", text: $Months)
                                            .modifier(Items.TextFieldModifier())
                                    }.padding().keyboardType(.numberPad)
                                    Button("Add") {
                                        goalVM.addCardGoal(goalName: Name, goalBalance: GoalBalance, months: Months)
                                        presentationMode.wrappedValue.dismiss()
                                    }.modifier(Items.ButtonModifier())
                                }
                                
                            }
                        }
                } .modifier(Items.AddGoalBtnModifier())
                )
            }
            .environmentObject(goalVM)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GoalCardViewModel())
    }
}
