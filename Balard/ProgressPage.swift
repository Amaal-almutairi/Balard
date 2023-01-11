//
//  ProgressPage.swift
//  Balard
//
//  Created by Remaz Abdulkareem Alghamdi on 06/01/2023.
//

import SwiftUI

struct ProgressPage: View {
    @EnvironmentObject var progressVM:GoalCardViewModel

    @State var progressValue: Float=0.0 //0.0 set as defalut
    @State var showingBottomSheet = false // false because we dont want to display the sheet until the user press the button
   // @Binding var otheramount = ""
    //we
    var body: some View {
        
        NavigationView{
            ZStack{
                
                Color("lightGray")
                    .ignoresSafeArea()
                
                VStack{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.gray), lineWidth: 1)
                        .frame(width:359 , height: 53)
                        .background(.white)
                        .overlay (
                            HStack{
                                Image(systemName: "lightbulb")
                                    .font(.system(size: 24))
                                    .foregroundColor(Color("lightGreen"))
                                Text("You need to save 1500 per month in order to achieve this goal")
                                    .font(.system(size: 18,weight: .regular))
                                    .foregroundColor(Color("darkBlue"))
                            }
                        ).padding(.top,-150)
                    
                    VStack{
                        ProgressBar( progress: self.$progressValue)//$progressValue binding varible of the state progressValue
                            .frame(width: 160.0, height: 160.0)
                            .padding(20.0).onAppear(){
                                self.progressValue = 0.00 //intial value 30%
                                
                            }
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
                                
                                Text("Add Money")
                                //  .buttonStyle(.borderedProminent)
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
                    // Text("test")
                    //  BottomSheetView()
                    BottomSheetView(showingBottomSheet: $showingBottomSheet, progressValue: $progressValue)
                    //size
                        .presentationDetents([.height(200)]) // by default its display the sheet in medium size "half page" but the user can make the sheet bigger by pull the sheet up , we can do( .presentationDetents([.height(100)])) a hight for the sheet we want , ( .presentationDetents([.height(100), .medium ])) this is display the sheet at 100 and the user can pull up to the half of the screen , .presentationDetents([.medium,.height(600)])
                        .presentationDragIndicator(.visible) // this is for the line on the top of the sheet
                }
            }
            .navigationBarTitle(Text("Vacation"))
            .navigationBarTitleDisplayMode(.large)
            .foregroundColor(Color("darkBlue"))
      }
        }
    }
    


    struct ProgressPage_Previews: PreviewProvider {
        static var previews: some View {
            let progressVM = GoalCardViewModel()
            ProgressPage()
                .environmentObject(progressVM)
        }
    }
    

