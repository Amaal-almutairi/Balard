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
//    @EnvironmentObject var goalVM:GoalCardViewModel
    @StateObject var goalVM = GoalCardViewModel()

    
    
    var body: some View {
      NavigationView {
          ZStack{
              Color("lightGray")
                  .ignoresSafeArea()
              
              VStack{
                  VStack{
                      
                      if goalVM.goalCards.isEmpty {
                          Image(systemName: "exclamationmark.circle")
                              .font(.system(size: 60))
                              .foregroundColor(Color("darkBlue"))
                              .padding()
                              .padding(.top,-90)
                          Text("No Goals \nTap ‘Add Goal’ to start saving your money and achive your goals").lineLimit(nil)
                              .multilineTextAlignment(.center)
                              .accessibilityLabel("No Goals \nTap  ‘Add Goal’ to start saving your money  and achive your goals")
                          //.accessibilityValue(goalCard.name ?? "your goal")
                              .accessibilityHint("Tap ‘Add Goal’ to start saving your money")
                      }else{
                          Form {
                              ForEach(goalVM.goalCards, id: \.id) {cardGoal in
                                  CardCustomView(goalCard: cardGoal)
                              } .onDelete(perform:goalVM.deleteCard)
                              // .environmentObject(goalVM)
                              
                          }
                      }
                      
                  }
                  
                  
              } .navigationBarTitle(Text("Explore"))
                  .navigationBarItems(trailing:
                                        HStack {
                      Image(systemName: "plus")
                          .accessibilityLabel("Add Goal")
                          .accessibilityHint("Add Your Goal")
                          .foregroundColor(Color("lightGreen"))
                          .padding(.leading)
                      Button("Add Goal") {
                          showAddGoalSheet.toggle()
                      }   .accessibilityLabel("Add Goal")
                      
                          .accessibilityHint("Add Your Goal")
                          .foregroundColor(.black).padding(.trailing)
                          .sheet(isPresented: $showAddGoalSheet){
                              AddGoalSheet()
                                  .presentationDetents([.height(470)])
                                  .presentationDragIndicator(.visible)
                          }
                  } .modifier(Items.AddGoalBtnModifier())
                  )}
            .onAppear(){
                goalVM.getCard()
            }
            
       }.environmentObject(goalVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let goalVM:GoalCardViewModel = GoalCardViewModel()
        ContentView().environmentObject(goalVM)
    }
}



