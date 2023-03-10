//
//  ProgressPage.swift
//  Balard
//
//  Created by Remaz Abdulkareem Alghamdi on 06/01/2023.
//

import SwiftUI

struct ProgressPage: View {
    @EnvironmentObject var goalVM:GoalCardViewModel
    let goalCard: GoalCards
    
    @State var progressValue: Float=0.0 //0.0 set as defalut
    @State var showingBottomSheet = false // false because we dont want to display the sheet until the user press the button
    var text16 = "Text16"
    var totalAmount:Int64 {
        let totalAmountGoal =  goalCard.goalBalance / goalCard.months
        return totalAmountGoal
    }
    var convertProgressToPersantage:Float {
        goalCard.balance == 0 ? 0: Float(goalCard.balance) / Float(goalCard.goalBalance)
    }
    var body: some View {
        ZStack{
            
            Color("Backg")
                .ignoresSafeArea()
            
            VStack{
                
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.gray), lineWidth: 1)
                    .frame(width:359 , height: 70)
                    .background(.white)
                    .overlay (
                        HStack{
                            Image(systemName: "lightbulb")
                                .font(.system(size: 24))
                                .foregroundColor(Color("lightBlue"))
                            VStack(alignment: .leading){
                                HStack{
                                    Text("You need to save per month" )
                                    Text("\(totalAmount)")
                                    
                                }
                                Text("in order to achieve this goal")
                            }

                                .font(.system(size: 18,weight: .regular))
                                .foregroundColor(Color("darkBlue"))
                            
                        }
                    ).padding(.top,-130)
                
                VStack{
                    ProgressBar( goalCard: goalCard)//$progressValue binding varible of the state progressValue
                        .frame(width: 160.0, height: 160.0)
                        .padding(20.0)   .onAppear(){


                            if goalCard.balance > goalCard.goalBalance {
                                goalCard.balance = goalCard.goalBalance
                                goalCard.progress = convertProgressToPersantage
                                //    Float(Double(goalCard.balance )) // increment 10% each time press the button
                            }
                        }
                    
//                        .onAppear(){
//                            self.progressValue = 0.00 //intial value 30%
//
//                        }
                    /*Button("increment"){
                     if (progressValue) < 1.0{
                     self.progressValue += 0.10 // increment 10% each time press the button
                     }else {
                     progressValue -= 1.0 //when it reach tghe value will not increment
                     }
                     }*/
                }
                
                VStack{
                    
                    Button{
                        showingBottomSheet.toggle() //we the user press the button it's dislplay the sheet
                        
                    } label: {
                        
                        ZStack{
                            
                            Text("Text28")
                                .frame(width:281 , height:41 )
                                .foregroundColor(.white)
                                .background(Color("lightBlue"))
                                .border(.gray)
                                .cornerRadius(8)
                                .fontWeight(.semibold)
                                .padding(.top,60)
                            
                        }
                    }
                }
            }
            .padding()
            .sheet(isPresented: $showingBottomSheet){
                BottomSheetView(progressValue: progressValue, goalCards: goalCard)
                
                //size
                    .presentationDetents([.height(200)]) // by default its display the sheet in medium size "half page" but the user can make the sheet bigger by pull the sheet up , we can do( .presentationDetents([.height(100)])) a hight for the sheet we want , ( .presentationDetents([.height(100), .medium ])) this is display the sheet at 100 and the user can pull up to the half of the screen , .presentationDetents([.medium,.height(600)])
                    .presentationDragIndicator(.visible) // this is for the line on the top of the sheet
            }
            
        }
        .navigationTitle(goalCard.name ?? "").navigationBarTitleDisplayMode(.inline)
//        .navigationBarItems(trailing: {
//            NavigationLink("Edit", destination: editAmount(goalCard: <#GoalCards#>, progressValue: <#Float#>, goalCards: <#GoalCards#>)
//        })
        .foregroundColor(Color("darkBlue"))
    }
}






//
//    struct ProgressPage_Previews: PreviewProvider {
//        static var previews: some View {
//            let progressVM = GoalCardViewModel()
//            ProgressPage(goalCard: progressVM.goalCards[0])
//                .environmentObject(progressVM)
//        }
//    }


