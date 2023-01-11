//
//  BottomSheetView.swift
//  Balard
//
//  Created by Amaal Almutairi on 17/06/1444 AH.
//

import SwiftUI

struct BottomSheetView: View {
    @EnvironmentObject var goalVM:GoalCardViewModel

    @Binding var showingBottomSheet:Bool
    @Binding var progressValue: Float
    @Environment(\.presentationMode) var presentationMode
    let goalCards:GoalCards
    @State var otheramount = ""
  
    
//    @State var dataArray : [String] = [] //create array to save the amounts tha the user will enter
    
    var body: some View{
        
        Spacer()
        VStack{
            
            
            VStack{
                HStack{
                    Image(systemName: "dollarsign.circle")
                        .font(.system(size: 24))
                        .foregroundColor(Color("lightGreen"))
                    Text("Text15")
                        .multilineTextAlignment(.leading)
                }
                Section{
//                    Text("\(Int(otheramount))")
                    TextField("Text22" , text: $otheramount)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 351,height: 51)
                        .padding(.bottom,20)
                    //  .padding(.top,-50)
                    
                    
                    
                }
                
            }
            Button{
                showingBottomSheet.toggle()
                let otheramountInt: Int = Int(otheramount) ?? 0
                goalVM.AddAmount(balance: otheramountInt, goalCard: goalCards) // call the function to add and save the amount
               // BottomSheetVM.getCard()
                otheramount = ""
                
                if (progressValue) < 1.0{
                    self.progressValue += 0.10 // increment 10% each time press the button
                }else {
                    progressValue -= 1.0 //when it reach tghe value will not increment
                }
               // presentationMode.wrappedValue.dismiss()
            }label: {
                //  NavigationLink(destination: ProgressPage())  {
                Text("Text8")
                    .frame(width:281 , height:41 )
                    .foregroundColor(.white)
                    .background(Color("lightBlue"))
                    .border(.gray)
                    .cornerRadius(8)
                    .fontWeight(.semibold)
                
                //  }
                //  }
            }
            
            //loop print the content of the array
//            ForEach(dataArray,id: \.self) { data in
//                Text(data)
//            }
            
        }
    }
        
//        func saveAmount() {
////            dataArray.append(BottomSheetVM.otheramount)
//        }
        
    }
//struct BottomSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        let BottomSheetVM = GoalCardViewModel()
//
//        ProgressPage()
//            .environmentObject(BottomSheetVM)
//    }
//}
