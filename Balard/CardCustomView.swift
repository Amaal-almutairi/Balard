//
//  CardCustomView.swift
//  Balard
//
//  Created by Amaal Almutairi on 14/06/1444 AH.
//

import SwiftUI
import CoreData

struct CardCustomView: View {
    @State private var progress = 0.75
  @EnvironmentObject var cardCustomVM: GoalCardViewModel
//    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.presentationMode) var presentationMode
    @State var presentCardGoalView = false
//    @Environment(\.managedObjectContext) var contextObject
    var body: some View {
    

              VStack{


                         ForEach(cardCustomVM.goalCards, id: \.self) { goalCard in
                             ZStack{
                                 Color("darkBlue")
                                     .background()
                                     .modifier(Items.CardShapModifier())
                                
                                 HStack(alignment: .top){
                                     Text(goalCard.name ?? "No goal").foregroundColor(.white)
                                   //  Spacer()
                                     
                                     VStack(alignment: .trailing,spacing:5){
                                         Text( goalCard.goalBalance ?? "goalBalance").foregroundColor(.white)
                                         Text(goalCard.balance ?? "No balance")
                                             .modifier(Items.TextStyleModifier())
                                             .padding(.bottom)
                                         //.padding(.trailing)
                                         //.padding(.bottom)
                                         //  Spacer()
                                         //                                         VStack(alignment: .trailing){
                                         //
                                         //
                                         //                                                // .padding(.trailing)
                                         //                                         }.modifier(Items.TextStyleModifier())
                                         // Spacer()
                                         //                        .padding(.horizontal,5)
                                         
                                         
                                         //.padding()
                                         //.padding(.bottom)
//                                         VStack(alignment: .trailing){
//
//                                         }.frame(width: 300, height: 20).padding()
                                         HStack{
                                             ProgressView(value: progress) {
                                             }   .modifier(Items.TextStyleModifier())
                                             
                                             Text("\(String(format: "%.0f%%", progress * 100))").foregroundColor(.white).padding(.bottom)
                                             
                                             
                                             
                                         }
                                         //.frame(width: 300, height: 20)
                                         HStack{
                                             Button {
                                                 
                                             } label: {
                                                 HStack{
                                                     Text("View More")
                                                     Spacer()
                                                     Image(systemName: "arrow.forward")
                                                 }
                                             }
                                             
                                         }.foregroundColor(.white)
                                       //  .frame(width: 300, height: 20)
                                             
                                         //.padding(.leading).padding(.trailing).padding(.bottom).foregroundColor(.white)
                                         
                                     }.padding(.bottom)
                                     
                                 }
                                // Spacer()
                                 // VStack(alignment: .leading){
                     
                                 
                                 // }
                            
//                                 Divider().foregroundColor(.gray).fontWeight(Font.Weight.medium)
                               
                             }.frame(width: 328, height: 168).padding(.leading).padding(.trailing)
                     }
                  
                         .onDelete(perform:cardCustomVM.deleteCard)
                  
              }
               .onAppear{
                   cardCustomVM.getCard()
                
               }
        }
   
    func printstatment(){
        print(" Successfully Fetch \(cardCustomVM.goalCards)")
    }
}
    



struct CardCustomView_Previews: PreviewProvider {
    static var previews: some View {
        let cardCustomVM = GoalCardViewModel()
            CardCustomView().environmentObject(cardCustomVM)
    }
}
