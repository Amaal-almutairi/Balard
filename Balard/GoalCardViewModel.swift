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

//    var convertProgressToPersantage:Float {
//        goalCard.balance == 0 ? 0: Float(goalCard.balance) / Float(goalCard.goalBalance)
//    }
//    
    func getCard(){
        
        
        goalCards = []
        
        let request = NSFetchRequest<GoalCards>(entityName: "GoalCards")
        do {
            goalCards = try container.viewContext.fetch(request)
            
        }catch let error {
            print("error fetching Data \(error)")
        }
        print(goalCards)
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
     func saveCardGoal(newCardGoal: GoalCards){

        do {
            try container.viewContext.save()
        }catch let error {
            print("error fetching Data \(error)")

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
    

}

