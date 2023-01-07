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

    func getCard(){
        let request = NSFetchRequest<GoalCards>(entityName: "GoalCards")
        do {
            goalCards = try container.viewContext.fetch(request)
        }catch let error {
            print("error fetching Data \(error)")
        }
    }
    
    func addCardGoal(goalName:String,goalBalance:String,months:String){
        let newCardGoal = GoalCards(context: container.viewContext)
        newCardGoal.name = goalName
        newCardGoal.goalBalance = goalBalance
        newCardGoal.months = months
        saveCardGoal()
    }
    
    func saveCardGoal(){
        do {
            try container.viewContext.save()
            getCard()
        }catch let error {
            print("error fetching Data \(error)")

        }
    }
}
