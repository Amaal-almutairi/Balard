//
//  ProgressBar.swift
//  Balard
//
//  Created by Amaal Almutairi on 17/06/1444 AH.
//

import SwiftUI

struct ProgressBar: View {
    @EnvironmentObject var progressVM:GoalCardViewModel
   // @State var GoalB : CardCustomView
   // let goalCard2: GoalCards
//    let goalCard: GoalCards

       @Binding var progress: Float //inserting the value that we want to update
       var color: Color = Color("lightBlue")
       //var color: Color = Color.green
       var body: some View{
           ZStack{
               //first circle which display the remining of the progress
               VStack{
                  // ForEach( progressVM.goalCards, id: \.id){ goal in
                      Text( "2000")
                  // Text(goalCard.balance ?? "")
                           .foregroundColor(Color("darkBlue"))
                           .font(.system(size: 36,weight: .regular))
                  // Text(goalCard.goalBalance ?? "")
                    Text("500000")
                           .foregroundColor(Color("ourgrey"))
                           .font(.system(size: 24,weight: .regular))
                   //}
               }
               Circle()
                   .stroke(lineWidth: 20.0)
                   .opacity(0.20)
                   .foregroundColor(Color.gray)
               
               //second circle which display the  the progress
               
               Circle()
                   .trim(from: 0.0 , to: CGFloat(min(self.progress,1.0))) //1.0 refers to 100
                   .stroke(style: StrokeStyle(lineWidth: 12.0 , lineCap: .round , lineJoin: .round))
                   .foregroundColor(color)//the color we supsfied as varible
                   .rotationEffect(Angle(degrees: 270)) //the prgress start at the top
                   .animation(.easeInOut(duration: 2.0))//two seconds
           }
       }
   }
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        let progressVM = GoalCardViewModel()
        ProgressPage()
            .environmentObject(progressVM)
    }
}
