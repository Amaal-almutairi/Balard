//
//  NumberOnly.swift
//  Balard
//
//  Created by Amaal Almutairi on 15/06/1444 AH.
//

import Foundation

class NumbersOnly: ObservableObject{
    
    @Published var goalBalancevalue = "" {
        
        didSet {
            
            let filtered = goalBalancevalue.filter{ $0.isNumber }
           // let filtered = monthsvalue.filter{ $0.isNumber }
            if goalBalancevalue != filtered{
                
                goalBalancevalue = filtered
            }
        }
    }
    
    @Published var monthsvalue = "" {
        
        didSet {
            
            let filtered = monthsvalue.filter{ $0.isNumber }
           // let filtered = monthsvalue.filter{ $0.isNumber }
            if monthsvalue != filtered{
                
                monthsvalue = filtered
            }
        }
    }
    
    @Published var balanceValue = "" {
        
        didSet {
            
            let filtered = balanceValue.filter{ $0.isNumber }
           // let filtered = monthsvalue.filter{ $0.isNumber }
            if balanceValue != filtered{
                
                balanceValue = filtered
            }
        }
    }
}
