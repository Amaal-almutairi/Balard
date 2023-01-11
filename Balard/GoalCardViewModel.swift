//
//  GoalCardViewModel.swift
//  Balard
//
//  Created by Amaal Almutairi on 13/06/1444 AH.
//

import Foundation
import CoreData

class GoalCardViewModel:ObservableObject{
    
    
    let container: NSPersistentContainer
    @Published var goalCards:[GoalCards] = []
   // @Published var balanceArr : [String] = []
    
    init() {
        container = NSPersistentContainer(name: "DataBase")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("error \(error)")
            }else {
                print("Successfully loaded")
            }
        }
       getCard()
    }

    func getCard(){
        
        
        goalCards = []
        
        let request = NSFetchRequest<GoalCards>(entityName: "GoalCards")
        do {
            goalCards = try container.viewContext.fetch(request)
            
        }catch let error {
            print("error fetching Data \(error)")
        }
    }
    /*
     if let str = zipField.text,
         let zip = Int16(str) {
         address?.zip = zip
     }
     */
    
    
    // this function allow user to add goalName,goalBalance,months to achive the goal balance

    func addCardGoal(goalName:String,goalBalance:String,months:String){
        let newCardGoal = GoalCards(context: container.viewContext)
        newCardGoal.id = UUID()
        newCardGoal.name = goalName
        newCardGoal.goalBalance = goalBalance
        newCardGoal.months = months
        saveCardGoal(newCardGoal: newCardGoal)
        getCard()
       // goalCards = []
    }
     func saveCardGoal(newCardGoal: GoalCards){

        do {
            try container.viewContext.save()
        }catch let error {
            print("error fetching Data \(error)")

        }
    }
//     this function allow user to add balance to achive the goal balance
    func AddAmount(balance:String,goalCard:GoalCards ) {
        goalCard.balance = balance
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
    

}

