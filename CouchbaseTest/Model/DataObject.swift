//
//  DataObject.swift
//  CouchbaseTest
//
//  Created by Brandon Askea on 3/21/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import Foundation
import CouchbaseLiteSwift

struct DataObject: Codable {
    
    var sub: Double = 0.0
    var grossDivisionEstimateAmount: Double = 0.0
    var budPercVarPct: Double = 0.0
    var budActVarPct: Double = 0.0
    var percEstVarPct: Double = 0.0
    var uniqueID: String = ""
    var grossBudgetAmount: Double = 0.0
    var budActVar: Double = 0.0
    var budEstVarPct: Double = 0.0
    var gen: Double = 0.0
    var percActVar: Double = 0.0
    var budEstVar: Double = 0.0
    var grossPercAmount: Double = 0.0
    var percActVarPct: Double = 0.0
    var percEstVar: Double = 0.0
    var actEstVarPct: Double = 0.0
    var grossActualAmount: Double = 0.0
    var budPercVar: Double = 0.0
    var accountDescription: String = ""
    var actEstVar: Double = 0.0
    
    init(document: Document) {
        sub = document.double(forKey: ParseKey.sub.string())
        grossDivisionEstimateAmount = document.double(forKey: ParseKey.grossDivisionEstimateAmount.string())
        budPercVarPct = document.double(forKey: ParseKey.budPercVarPct.string())
        budActVarPct = document.double(forKey: ParseKey.budActVarPct.string())
        percEstVarPct = document.double(forKey: ParseKey.percEstVarPct.string())
        uniqueID = document.string(forKey: ParseKey.uniqueID.string()) ?? ""
        grossBudgetAmount = document.double(forKey: ParseKey.grossBudgetAmount.string())
        budActVar = document.double(forKey: ParseKey.budActVar.string())
        budEstVarPct = document.double(forKey: ParseKey.budEstVarPct.string())
        gen = document.double(forKey: ParseKey.gen.string())
        percActVar = document.double(forKey: ParseKey.percActVar.string())
        budEstVar = document.double(forKey: ParseKey.budEstVar.string())
        grossPercAmount = document.double(forKey: ParseKey.grossPercAmount.string())
        percActVarPct = document.double(forKey: ParseKey.percActVarPct.string())
        percEstVar = document.double(forKey: ParseKey.percEstVar.string())
        actEstVarPct = document.double(forKey: ParseKey.actEstVarPct.string())
        grossActualAmount = document.double(forKey: ParseKey.grossActualAmount.string())
        budPercVar = document.double(forKey: ParseKey.budPercVar.string())
        accountDescription = document.string(forKey: ParseKey.accountDescription.string()) ?? ""
        actEstVar = document.double(forKey: ParseKey.actEstVar.string())
    }
    
}
