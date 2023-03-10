//
//  GoalCardViewModel.swift
//  Balard
//
//  Created by Amaal Almutairi on 13/06/1444 AH.
//

import Foundation
import CoreData

class GoalCardViewModel:ObservableObject{
    
//    let goalCard:GoalCards
    let container: NSPersistentContainer
    @Published var goalCards:[GoalCards] = []
    
    init() {
        container = NSPersistentContainer(name: "DataBase")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("error \(error)")
            }else {
                print("Successfully loaded")
            }
        }
//        var convertProgressToPersantage:Float {
//            goalCard.balance == 0 ? 0: Float(goalCard.balance) / Float(goalCard.goalBalance)
//        }
       getCard()
    }

   
   
    func getCard(){
        
        print("Get card ***")
        goalCards = []
        
        let request = NSFetchRequest<GoalCards>(entityName: "GoalCards")
        do {
            goalCards = try container.viewContext.fetch(request)
            
        }catch let error {
            print("error fetching Data \(error)")
        }
       // print(goalCards)
    }
    // this function allow user to add goalName,goalBalance,months to achive the goal balance
  
    func addCardGoal(goalName:String,goalBalance:Int,months:Int){
        let newCardGoal = GoalCards(context: container.viewContext)
        newCardGoal.id = UUID()
        newCardGoal.name = goalName
        newCardGoal.goalBalance = Int64(goalBalance)
        newCardGoal.months = Int64(months)
        saveCardGoal(newCardGoal: newCardGoal)
        getCard()
       // goalCards = []
    }
    
//    func editGoal(newCardGoal: GoalCards,goalName:String,goalBalance:Int,months:Int) {
    func editGoal(goalCard: GoalCards,goalName:String,goalBalance:Int,months:Int) {
        goalCard.name = goalName
        goalCard.goalBalance = Int64(goalBalance)
        goalCard.months = Int64(months)
        saveCardGoal(newCardGoal: goalCard)
       // getCard()
       // newCardGoal.balance =
    }
    func editBalance(goalCard: GoalCards,balance:Int,progress:Float) {
        goalCard.balance = Int64(balance)
        goalCard.progress = progress
        saveCardGoal(newCardGoal: goalCard)
       // getCard()
       // newCardGoal.balance =
    }
    
     func saveCardGoal(newCardGoal: GoalCards){

         container.viewContext.performAndWait {
             do {
                 try container.viewContext.save()
             }catch let error {
                 print("error fetching Data \(error)")

             }
         }
        
    }
//     this function allow user to add balance to achive the goal balance
    func AddAmount(balance:Int ,goalCard:GoalCards,progress:Float ) {
        
        goalCard.balance += Int64(balance)
        goalCard.progress = Float(progress)
        saveCardGoal(newCardGoal: goalCard)
        getCard()
    }
    func deleteCard(Index:IndexSet){
        guard let index = Index.first else{return}
        let goalCard = goalCards[index]
        container.viewContext.delete(goalCard)
        getCard()
       saveCardGoal(newCardGoal: goalCard)
    }
    
//    func delete(cardGoal: GoalCards) {
//        container.viewContext.delete(cardGoal)
//
//        do {
//            try container.viewContext.save()
//        }catch let error {
//            container.viewContext.rollback()
//            print("error fetching Data \(error)")
//
//        }
//    }
}

