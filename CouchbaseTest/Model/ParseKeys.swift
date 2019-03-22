//
//  ParseKeys.swift
//  CouchbaseTest
//
//  Created by Brandon Askea on 3/22/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import Foundation

enum ParseKey: Int {
    case sub = 0,
    grossDivisionEstimateAmount,
    budPercVarPct,
    budActVarPct,
    percEstVarPct,
    uniqueID,
    grossBudgetAmount,
    budActVar,
    budEstVarPct,
    gen,
    percActVar,
    budEstVar,
    grossPercAmount,
    percActVarPct,
    percEstVar,
    actEstVarPct,
    grossActualAmount,
    budPercVar,
    accountDescription,
    actEstVar
}
extension ParseKey: CaseIterable {
    func string() -> String {
        switch rawValue {
        case 0: return "sub"
        case 1: return "grossDivisionEstimateAmount"
        case 2: return "budPercVarPct"
        case 3: return "budActVarPct"
        case 4: return "percEstVarPct"
        case 5: return "uniqueID"
        case 6: return "grossBudgetAmount"
        case 7: return "budActVar"
        case 8: return "budEstVarPct"
        case 9: return "gen"
        case 10: return "percActVar"
        case 11: return "budEstVar"
        case 12: return "grossPercAmount"
        case 13: return "percActVarPct"
        case 14: return "percEstVar"
        case 15: return "actEstVarPct"
        case 16: return "grossActualAmount"
        case 17: return "budPercVar"
        case 18: return "accountDescription"
        case 19: return "actEstVar"
        default: return ""
        }
    }
}
