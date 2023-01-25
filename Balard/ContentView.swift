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
    @StateObject var goalVM = GoalCardViewModel()
    // @State  var goal:GoalCards
    @StateObject var numberOnly:NumbersOnly = NumbersOnly()

    var body: some View {
        NavigationView {
            ZStack{
                Color("Backg")
                    .ignoresSafeArea()
                
                VStack{
                    VStack{
                        
                        if goalVM.goalCards.isEmpty {
                            Image(systemName: "exclamationmark.circle")
                                .font(.system(size: 60))
                                .foregroundColor(Color("darkBlue"))
                                .padding()
                                .padding(.top,-90)
                            Text("Text11")
                            Text("Text12").lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .accessibilityLabel("No Goals \nTap  ‘Add Goal’ to start saving your money  and achive your goals")
                            //.accessibilityValue(goalCard.name ?? "your goal")
                                .accessibilityHint("Tap ‘Add Goal’ to start saving your money")
                        }else{
                            List {
                                ForEach(goalVM.goalCards, id: \.id) {cardGoal in
                                    CardCustomView(goalCard: cardGoal)
//                                        .swipeActions(edge: .leading) {
//                                            NavigationLink("Edit", destination:  EditCard(goalCard: cardGoal))
//                                                .tint(.green)
//                                        }
//                                    NavigationLink("Edit", destination:  EditCard(goalCard: cardGoal))
                                        
                                }
                                .onDelete(perform:goalVM.deleteCard)
                                    .listRowSeparator(.hidden).listRowBackground(Color.clear)
//
                                    
//                                        Button {
//
////                                                let goalAmount: Int = Int(numberOnly.goalBalancevalue) ?? 1
////                                                let monthInt: Int = Int(numberOnly.monthsvalue) ?? 2
//////
////                                            goalVM.editGoal(goalCard: cardGoal, goalName: cardGoal.name ?? "", goalBalance: Int(cardGoal.goalBalance), months: Int(cardGoal.months))
//                                        } label: {
//                                            Label("Edit", systemImage: "square.and.pencil")
//                                        }
//                                        .tint(.green)
//                                    }
                            }
                            .listStyle(.plain)
                                
                            
                        }
                        
                        
                    } .navigationBarTitle(Text("Text1"))
                        .navigationBarItems(trailing:
                                               // HStack {
//                            Image(systemName: "plus")
//                                .accessibilityLabel("Text2")
//                                .accessibilityHint("Text25")
//                                .foregroundColor(Color("lightBlue"))
//                                .padding(.leading)
                            Button {
                                showAddGoalSheet.toggle()
                            } label: {
                                HStack{
                                    Image(systemName: "plus")
                                    Text("Text2")
                                }
                             

                            }.accessibilityLabel("Text2")
                                       .foregroundColor(.accentColor)

//                            Button("Text2") {
//                                showAddGoalSheet.toggle()
//
//                            }   .accessibilityLabel("Text2")
//                                .foregroundColor(.accentColor)
//
//                                .accessibilityHint("Text25")
//                                .foregroundColor(.black).padding(.trailing)
                                .sheet(isPresented: $showAddGoalSheet){
                                    AddGoalSheet()
                                        .presentationDetents([.height(470)])
                                        .presentationDragIndicator(.visible)
                                }
                       // }
                        )
                    
                }

                
            }
        }.environmentObject(goalVM).navigationViewStyle(.stack)
    }
}
//struct ContentView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        let goalVM:GoalCardViewModel = GoalCardViewModel()
//        ContentView(goal: ).environmentObject(goalVM)
//    }
//}



