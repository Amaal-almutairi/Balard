//
//  CardCustomView.swift
//  Balard
//
//  Created by Amaal Almutairi on 14/06/1444 AH.
//

import SwiftUI
import CoreData

struct test2: View {
    @State private var progress:Float = 0.0

    let goalCard: GoalCards
    @EnvironmentObject var goalVM: GoalCardViewModel
    @Environment(\.presentationMode) var prezsentationMode
    @State var presentProgressView = false
    @State  var showCardGoalView = false
    @State  var goal:GoalCards
    var convertProgressToPersantage:Float {
        Float(Double(goal.balance) + Double(goal.goalBalance) / 100)
    }

    var body: some View {
        VStack{
            ZStack{
                Color("darkBlue")
                    .background()
                    .modifier(Items.CardShapModifier())
                VStack(alignment: .trailing){
                    HStack{
                        Text(goalCard.name ?? "Text19")
                            .font(.system(size:30 , weight: .medium))
                            .accessibilityLabel("Your goal")
                            .accessibilityValue(goalCard.name ?? "your goal")
                            .accessibilityHint("Add your goal")
                        Spacer()
                        Text("\(goalCard.goalBalance)")
                            .font(.system(size:21 , weight: .regular))
                            .accessibilityLabel("Target Goal")
                            .accessibilityValue(String(goalCard.goalBalance ))
                        
                    }
                    VStack{
                        Text("\(goalCard.balance)")
                            .font(.system(size:16 , weight: .regular))
                            .foregroundColor(Color("ourgrey"))
                            .accessibilityLabel("You saved")
                            .accessibilityValue(String(goalCard.balance ))
                        
                    }
                    HStack(alignment: .center){
                        ProgressView(value: goalCard.progress) {
                        }   .modifier(Items.TextStyleModifier())
                        Text("\(String(format: "%.0f%%", goalCard.progress * 100))")
                            .accessibilityValue("\(String(format: "%.0f%%", goalCard.progress * 100))")
                            .foregroundColor(.white)
                           
                                .onAppear(){
                                    goalCard.progress = 0.00 //intial value 30%
                                    if (goalCard.progress) < 1.0{
                                        goalCard.progress += Float(Int(goalCard.balance )) // increment 10% each time press the button
                                    }else {
                                        goalCard.progress -= 1.0 //when it reach tghe value will not increment
                                    }
                                }
                    }
                    /*
                    HStack(alignment: .center){

                        ProgressView(value: progress) {
                            
                        }   .modifier(Items.TextStyleModifier())
                        Text("\(String(format: "%.0f%%", convertProgressToPersantage / 100  ))")
//goalCard.progress - Float(goalCard.goalBalance
                           // .accessibilityValue("\(String(format: "%.0f%%", progress * 100))")
                            .foregroundColor(.white)

                            .onAppear(){
                                self.progress = 0.00 //intial value 30%
                                if (goalCard.progress) < 1.0{
                                    self.progress += Float(Int(Double(goalCard.balance )))// increment 10% each time press the button
//Float(Int(Double(goalCard.balance / 100)))
                                    //                                    progress += Float(goalCard.balance + Int64(goalCard.progress) ) // increment 10% each time press the button

                                    
//                                    for i in 0...goalCard.goalBalance{
//                                        goalCard.progress += Float(goalCard.balance / 100) // increment 10% each time press the button
//                                    }
                                }else {
                                    progress -= 1.0 //when it reach tghe value will not increment
                                }
                            }
                    
                    }
                     */
                    /*
                     .onAppear(){
                         progress = 0.00
                         if goalCard.balance > goalCard.goalBalance {
                             goalCard.balance = goalCard.goalBalance
                             progress -= Float(Int(Double(goalCard.balance )))// increment 10% each time press the button
                         }else{
                            progress += Float(Int(Double(goalCard.balance )))// increment 10% each time press the button
                         }
                         //intial value 30%
//                                if (progress) < 1.0{
//                                    progress += Float(Int(Double(goalCard.balance )))// increment 10% each time press the button
////Float(Int(Double(goalCard.balance / 100)))
//                                    //                                    progress += Float(goalCard.balance + Int64(goalCard.progress) ) // increment 10% each time press the button
//
//
////                                    for i in 0...goalCard.goalBalance{
////                                        goalCard.progress += Float(goalCard.balance / 100) // increment 10% each time press the button
////                                    }
//                                }else {
//                                    progress -= 1.0 //when it reach tghe value will not increment
//                                }
                     }
                     
                      \\\MARK: it's coreect solution
                     */
                    Divider().foregroundColor(.gray).fontWeight(Font.Weight.medium)
                    
                    NavigationLink {
                        ProgressPage(goalCard: goalCard)
                    } label: {
                        Text("Text13")
                            .foregroundColor(Color("ourgrey"))
                    }
                    
                    
                }.padding(.leading).padding(.trailing)
            }.frame(width: 328, height: 168).foregroundColor(.white)
        }
        .fullScreenCover(isPresented: $presentProgressView){
            ProgressPage( goalCard: goalCard)
            
        }
    }
    
}
struct ProgressViewExample1: View {
    @State private var progress = 0.5
    var body: some View {
        VStack {
            Spacer()
            ProgressView.init(value: progress) {
                Text("Almost done: \(String(format: "%.0f%%", progress * 100))")
            }
            Spacer()
            Slider(value: $progress, in: 0...1)
        }
        .tint(.orange)
        .padding()
    }
}



struct test2_Previews: PreviewProvider {
    static var previews: some View {
        let cardCustomVM = GoalCardViewModel()
       // CardCustomView(goalCard: GoalCards.init(context: managedObjectContext)).environmentObject(cardCustomVM)
    }
}






/*
 //
 //  CardCustomView.swift
 //  Balard
 //
 //  Created by Amaal Almutairi on 14/06/1444 AH.
 //

 import SwiftUI
 import CoreData

 struct CardCustomView: View {
     @State private var progress:Float = 0.0

     let goalCard: GoalCards
     @EnvironmentObject var goalVM: GoalCardViewModel
     @Environment(\.presentationMode) var prezsentationMode
     @State var presentProgressView = false
     @State  var showCardGoalView = false
     @State  var goal:GoalCards
     var convertProgressToPersantage:Float {
 //        Float(Double(goal.balance) + Double(goal.goalBalance) / Double(goal.goalBalance))
         Float(Double(goal.balance) + Double(goal.goalBalance) / Double(goal.goalBalance))

     }

     var body: some View {
         VStack{
             ZStack{
                 Color("darkBlue")
                     .background()
                     .modifier(Items.CardShapModifier())
                 VStack(alignment: .trailing){
                     HStack{
                         Text(goalCard.name ?? "Text19")
                             .font(.system(size:30 , weight: .medium))
                             .accessibilityLabel("Your goal")
                             .accessibilityValue(goalCard.name ?? "your goal")
                             .accessibilityHint("Add your goal")
                         Spacer()
                         Text("\(goalCard.goalBalance)")
                             .font(.system(size:21 , weight: .regular))
                             .accessibilityLabel("Target Goal")
                             .accessibilityValue(String(goalCard.goalBalance ))
                         
                     }
                     VStack{
                         Text("\(goalCard.balance)")
                             .font(.system(size:16 , weight: .regular))
                             .foregroundColor(Color("ourgrey"))
                             .accessibilityLabel("You saved")
                             .accessibilityValue(String(goalCard.balance ))
                         
                     }
                     
                     HStack(alignment: .center){

                         ProgressView(value: goalCard.progress) {
                             
                         }   .modifier(Items.TextStyleModifier())
                         Text("\(String(format: "%.0f%%", Float(Int(Double(goalCard.balance )))  - goalCard.progress  / 100 ))")
 //goalCard.progress - Float(goalCard.goalBalance
                            // .accessibilityValue("\(String(format: "%.0f%%", progress * 100))")
                             .foregroundColor(.white)

                             .onAppear(){
                                 self.progress = 0.00
                                 if goalCard.balance > goalCard.goalBalance {
                                     goalCard.balance = goalCard.goalBalance
                                     self.progress = convertProgressToPersantage
                                     Float(Int(Double(goalCard.balance ))) increment 10% each time press the button
                                 }else{
                                     
                                     if (progress) < 1.0{
                                         self.progress += Float(Int(Double(goalCard.balance )))  increment 10% each time press the button
                                     }else {
                                         progress += Float(Int(Double(goalCard.balance )))
                                         progress -= 1.0
                                     }
                                     
                                 }
                             }
                                 //intial value 30%
 //                                if (progress) < 1.0{
 //                                    progress += Float(Int(Double(goalCard.balance )))// increment 10% each time press the button
 ////Float(Int(Double(goalCard.balance / 100)))
 //                                    //                                    progress += Float(goalCard.balance + Int64(goalCard.progress) ) // increment 10% each time press the button
 //
 //
 ////                                    for i in 0...goalCard.goalBalance{
 ////                                        goalCard.progress += Float(goalCard.balance / 100) // increment 10% each time press the button
 ////                                    }
 //                                }else {
 //                                    progress -= 1.0 //when it reach tghe value will not increment
 //                                }
                           //  }
                     }
                     Divider().foregroundColor(.gray).fontWeight(Font.Weight.medium)
                     
                     NavigationLink {
                         ProgressPage(goalCard: goalCard)
                     } label: {
                         Text("Text13")
                             .foregroundColor(Color("ourgrey"))
                     }
                     
                     
                 }.padding(.leading).padding(.trailing)
             }.frame(width: 328, height: 168).foregroundColor(.white)
         }
         .fullScreenCover(isPresented: $presentProgressView){
             ProgressPage( goalCard: goalCard)
             
         }
     }
     
 }
 struct ProgressViewExample: View {
     @State private var progress = 0.5
     var body: some View {
         VStack {
             Spacer()
             ProgressView.init(value: progress) {
                 Text("Almost done: \(String(format: "%.0f%%", progress * 100))")
             }
             Spacer()
             Slider(value: $progress, in: 0...1)
         }
         .tint(.orange)
         .padding()
     }
 }



 struct CardCustomView_Previews: PreviewProvider {
     static var previews: some View {
         let cardCustomVM = GoalCardViewModel()
        // CardCustomView(goalCard: GoalCards.init(context: managedObjectContext)).environmentObject(cardCustomVM)
     }
 }







 */

























/*
 //
 //  CardCustomView.swift
 //  Balard
 //
 //  Created by Amaal Almutairi on 14/06/1444 AH.
 //

 import SwiftUI
 import CoreData

 struct CardCustomView: View {
     
     let goalCard: GoalCards
     @State private var progress:Float = 0.75
     @EnvironmentObject var goalVM: GoalCardViewModel
     @Environment(\.presentationMode) var prezsentationMode
     @State var presentProgressView = false
     @State  var showCardGoalView = false
     
     var body: some View {
         VStack{
             ZStack{
                 Color("darkBlue")
                     .background()
                     .modifier(Items.CardShapModifier())
                 VStack(alignment: .trailing){
                     HStack{
                         Text(goalCard.name ?? "Text19")
                             .font(.system(size:30 , weight: .medium))
                             .accessibilityLabel("Your goal")
                             .accessibilityValue(goalCard.name ?? "your goal")
                             .accessibilityHint("Add your goal")
                         Spacer()
                         Text("\(goalCard.goalBalance)")
                             .font(.system(size:21 , weight: .regular))
                             .accessibilityLabel("Target Goal")
                             .accessibilityValue(String(goalCard.goalBalance ))
                         
                     }
                     VStack{
                         Text("\(goalCard.balance)")
                             .font(.system(size:16 , weight: .regular))
                             .foregroundColor(Color("ourgrey"))
                             .accessibilityLabel("You saved")
                             .accessibilityValue(String(goalCard.balance ))
                         
                     }
                     HStack(alignment: .center){
                         
                         ProgressView(value: goalCard.progress,total: 100) {
                         }   .modifier(Items.TextStyleModifier())
                         Text("\(String(format: "%.0f%%", goalCard.progress * 100) )")
                         
                            // .accessibilityValue("\(String(format: "%.0f%%", progress * 100))")
                             .foregroundColor(.white)
                         
                             .onAppear(){
                                 goalCard.progress = 0.00 //intial value 30%
                                 if (goalCard.progress) < 1.0{
                                     
                                     goalCard.progress += Float(goalCard.balance / 100) // increment 10% each time press the button
                                 }else {
                                     goalCard.progress -= 1.0 //when it reach tghe value will not increment
                                 }
                             }
                     }
                     Divider().foregroundColor(.gray).fontWeight(Font.Weight.medium)
                     
                     NavigationLink {
                         ProgressPage(goalCard: goalCard)
                     } label: {
                         Text("Text13")
                             .foregroundColor(Color("ourgrey"))
                     }
                     
                     
                 }.padding(.leading).padding(.trailing)
             }.frame(width: 328, height: 168).foregroundColor(.white)
         }
         .fullScreenCover(isPresented: $presentProgressView){
             ProgressPage( goalCard: goalCard)
             
         }
     }
     
 }



 //
 //struct CardCustomView_Previews: PreviewProvider {
 //    static var previews: some View {
 //        let cardCustomVM = GoalCardViewModel()
 //        //        CardCustomView(goalCard: GoalCards(entity: [], insertInto: cardCustomVM.goalCards)).environmentObject(cardCustomVM)
 //    }
 //}







 */




//
//  AddGoalSheet.swift
//  Balard
//
//  Created by Amaal Almutairi on 17/06/1444 AH.
//
/*
import SwiftUI

struct AddGoalSheet: View {
    @State var name = ""
    @State var goalBalance = ""
    @State var months = ""
    @StateObject var numberOnly:NumbersOnly = NumbersOnly()
    @EnvironmentObject var goalVM:GoalCardViewModel
    @Environment(\.presentationMode) var prezsentationMode
    let goal:GoalCards
    
    var body: some View {
        Form{
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Text3")
                    TextField(name, text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                } .padding()
                VStack(alignment: .leading){
                    Text("Text5")
                    TextField(goalBalance, text: $numberOnly.goalBalancevalue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                VStack(alignment: .leading){
                    Text("Text7")
                    TextField(months, text: $numberOnly.monthsvalue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
                Button("Text21") {
                    if name.isEmpty && numberOnly.goalBalancevalue.isEmpty &&  numberOnly.monthsvalue.isEmpty {
                        let goalAmount: Int = Int(numberOnly.goalBalancevalue) ?? 1
                        let monthInt: Int = Int(numberOnly.monthsvalue) ?? 2
                        
                        goalVM.addCardGoal(goalName: name, goalBalance:  goalAmount, months:monthInt)

                        name = ""
                        numberOnly.goalBalancevalue = ""
                        numberOnly.monthsvalue = ""
                        prezsentationMode.wrappedValue.dismiss()
                        print("add new goal")
                    }else {
                       
                        let goalAmount: Int = Int(numberOnly.goalBalancevalue) ?? 1
                        let monthInt: Int = Int(numberOnly.monthsvalue) ?? 2
                        goalVM.editGoal(newCardGoal: goal, goalName: name, goalBalance: goalAmount, months: monthInt)
                    }
                    
                }.modifier(Items.ButtonModifier())
            }
            
        }
    }
}

//struct AddGoalSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        let goalVM:GoalCardViewModel = GoalCardViewModel()
//        AddGoalSheet( goal: <#GoalCards#>).environmentObject(goalVM)
//    }
//}
*/
