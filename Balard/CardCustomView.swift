////
////  CardCustomView.swift
////  Balance-Guard
////
////  Created by Amaal Almutairi on 13/06/1444 AH.
////
//
//import SwiftUI
//
//struct CardCustomView: View {
//    @State private var progress = 0.75
//    @EnvironmentObject var cardCustomVM:GoalCardViewModel
//    var body: some View {
//        VStack{
//           // ForEach(cardCustomVM.goalCards) { goalCard in
//                HStack{
//                    Text(" name \(goalCard.name)")
//                    Spacer()
//                    VStack{
//
//                        Text(" goalBalance \(goalCard.goalBalance)")
//                        Text(" balance \(goalCard.balance)")
//                    }   .padding(.top,30).padding(.trailing)
//
//                } .padding(.leading) .padding(.top,20)
//                //  Spacer()
//                HStack{
//                    ProgressView(value: progress) {
//                    }
//                    Text("\(String(format: "%.0f%%", progress * 100))")
//
//
//                }.padding()
//                //  Divider()
//                VStack(alignment: .leading){
//                    HStack{
//                        Button {
//
//                        } label: {
//                            Text("View More")
//                            Spacer()
//                            Image(systemName: "arrow.forward")
//                        }
//                        Divider()
//                    }.padding().padding(.bottom,30)
//
//                }
//          //  }
//
//
//        }     .frame(width: 328, height: 168) .background(Color("darkBlue")).cornerRadius(20).foregroundColor(.white) }
//    }
////}
//
//struct CardCustomView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardCustomView()
//            .environmentObject(GoalCardViewModel())
//    }
//}
