//
//  test.swift
//  Balard
//
//  Created by Amaal Almutairi on 16/06/1444 AH.
//

import SwiftUI

struct test: View {
    @State private var progress:Float = 0.75
    @EnvironmentObject var cardCustomVM: GoalCardViewModel
    //    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.presentationMode) var presentationMode
    @State var presentCardGoalView = false
    @State var presentProgressView = false
    @State  var showCardGoalView = false
    
    var color: Color = Color("lightBlue")
    var body: some View {
        VStack{
            ForEach(cardCustomVM.goalCards, id: \.self) { goalCard in
                ZStack{
                    Color("darkBlue")
                        .background()
                        .modifier(Items.CardShapModifier())
                    VStack(alignment: .trailing){
                        HStack{
                            Text(goalCard.balance ?? "balance")
                            Spacer()
                            Text(goalCard.balance ?? "balance")
                        }
                        VStack{
                            Text(goalCard.balance ?? "balance")
                        }
                        HStack(alignment: .center){
                            ProgressView(value: progress) {
                            }   .modifier(Items.TextStyleModifier())
                            Text("\(String(format: "%.0f%%", progress * 100))").foregroundColor(.white)
                               
                                    .onAppear(){
                                        self.progress = 0.00 //intial value 30%
                                        if (progress) < 1.0{
                                            self.progress += 0.10 // increment 10% each time press the button
                                        }else {
                                            progress -= 1.0 //when it reach tghe value will not increment
                                        }
                                    }
                        }
                        Divider().foregroundColor(.gray).fontWeight(Font.Weight.medium)
                        HStack(alignment: .center){
                            Button {
                                presentProgressView = true
                                showCardGoalView = false
                            } label: {
                                HStack{
                                    Text("View More")
                                    Spacer()
                                    Image(systemName: "arrow.forward")
                                }
                            }
                            
                        }.foregroundColor(.white)
                        
                    }.padding(.leading).padding(.trailing)
                }.frame(width: 328, height: 168).foregroundColor(.white)
    }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        let cardCustomVM = GoalCardViewModel()
        test() .environmentObject(cardCustomVM)
        
    }
}
//        VStack{
//
//
//            // ForEach(cardCustomVM.goalCards, id: \.self) { goalCard in
//            ZStack{
//                Color("darkBlue")
//                    .background()
//                    .modifier(Items.CardShapModifier())
//
//
//                VStack{
//                    HStack(alignment: .center){
//                        Text( "No goal").foregroundColor(.white).padding(.trailing).padding(.top,30)
//                        Spacer()
//                        VStack(alignment: .trailing){
//                            Text( "goalBalance")
//                            Text("Balance")
//                                .modifier(Items.TextStyleModifier())
//                                .padding(.trailing)
//                        }.modifier(Items.TextStyleModifier()).padding(.top,50)
//                      // Spacer()
//    //                        .padding(.horizontal,5)
//
//
//                    } .modifier(Items.TextStyleModifier())
//                    HStack(alignment: .center){
//                        ProgressView(value: progress) {
//
//                        }   .modifier(Items.TextStyleModifier())
//
//                        Text("\(String(format: "%.0f%%", progress * 100))").foregroundColor(.white).padding(.bottom)
//
//                            .padding(20.0).onAppear(){
//                                self.progress = 0.00 //intial value 30%
//                                if (progress) < 1.0{
//                                    self.progress += 0.10 // increment 10% each time press the button
//                                }else {
//                                    progress -= 1.0 //when it reach tghe value will not increment
//                                }
//                            }
//
//                    }.padding(.vertical)
//                    HStack{
//                        Button {
//
//                        } label: {
//                            Text("View More")
//                            Spacer()
//                            Image(systemName: "arrow.forward")
//                        }
//
//                    }.foregroundColor(.white)
//
//                }
//
//
////                Divider().foregroundColor(.gray).fontWeight(Font.Weight.medium)
//
//            }.frame(width: 328, height: 168)
//            //  }
//
//        }
