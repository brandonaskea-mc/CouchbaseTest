//
//  DatabaseManager.swift
//  CouchbaseTest
//
//  Created by Brandon Askea on 3/21/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit
import CouchbaseLiteSwift

let databaseName = "data"

class DatabaseManager: NSObject, DataSourceProtocol {
    
    static let instance = DatabaseManager()
    
    func getDatabaseWith(name: String) -> Database? {
        do {
            return try Database(name: name)
        } catch { return nil }
    }
    
    func storeData() {
        
        // Get JSON file path
        guard let path = Bundle.main.path(forResource: databaseName, ofType: "json") else { return }
        
        do {
            
            // Convert File into JSON
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonSer = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            guard let json = jsonSer as? [String: AnyObject] else { return }
            
            // Parse
            parse(json)
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func parse(_ json: [String: AnyObject]) {
        
        func doubleValueIn(_ json: [String: AnyObject], withKey key: String) -> Double {
            if let value = json[key] as? Double {
                return value
            }
            return 0.0
        }
        
        func stringValueIn(_ json: [String: AnyObject], withKey key: String) -> String {
            if let value = json[key] as? String {
                return value
            }
            return ""
        }
        
        // Drill down to values
        guard let values = json[Constants.Parse.returnValue] as? [[String: AnyObject]]
        else { return }
        
        // Parse JSON
        for v in values {
            
            let subKey = ParseKey.grossDivisionEstimateAmount.string()
            let grossDivisionEstimateAmountKey = ParseKey.grossDivisionEstimateAmount.string()
            let budPercVarPctKey = ParseKey.budPercVarPct.string()
            let budActVarPctKey = ParseKey.budActVarPct.string()
            let percEstVarPctKey = ParseKey.percEstVarPct.string()
            let uniqueIDKey = ParseKey.uniqueID.string()
            let grossBudgetAmountKey = ParseKey.grossBudgetAmount.string()
            let budActVarKey = ParseKey.budActVar.string()
            let budEstVarPctKey = ParseKey.budEstVarPct.string()
            let genKey = ParseKey.gen.string()
            let percActVarKey = ParseKey.percActVar.string()
            let budEstVarKey = ParseKey.budEstVar.string()
            let grossPercAmountKey = ParseKey.grossPercAmount.string()
            let percActVarPctKey = ParseKey.percActVarPct.string()
            let percEstVarKey = ParseKey.percEstVar.string()
            let actEstVarPctKey = ParseKey.actEstVarPct.string()
            let grossActualAmountKey = ParseKey.grossActualAmount.string()
            let budPercVarKey = ParseKey.budPercVar.string()
            let accountDescriptionKey = ParseKey.accountDescription.string()
            let actEstVarKey = ParseKey.actEstVar.string()
            
            let sub = doubleValueIn(v, withKey: subKey)
            let grossDivisionEstimateAmount = doubleValueIn(v, withKey: grossDivisionEstimateAmountKey)
            let budPercVarPct = doubleValueIn(v, withKey: budPercVarPctKey)
            let budActVarPct = doubleValueIn(v, withKey: budActVarPctKey)
            let percEstVarPct = doubleValueIn(v, withKey: percEstVarPctKey)
            let uniqueID = stringValueIn(v, withKey: uniqueIDKey)
            let grossBudgetAmount = doubleValueIn(v, withKey: grossBudgetAmountKey)
            let budActVar = doubleValueIn(v, withKey: budActVarKey)
            let budEstVarPct = doubleValueIn(v, withKey: budEstVarPctKey)
            let gen = doubleValueIn(v, withKey: genKey)
            let percActVar = doubleValueIn(v, withKey: percActVarKey)
            let budEstVar = doubleValueIn(v, withKey: budEstVarKey)
            let grossPercAmount = doubleValueIn(v, withKey: grossPercAmountKey)
            let percActVarPct = doubleValueIn(v, withKey: percActVarPctKey)
            let percEstVar = doubleValueIn(v, withKey: percEstVarKey)
            let actEstVarPct = doubleValueIn(v, withKey: actEstVarPctKey)
            let grossActualAmount = doubleValueIn(v, withKey: grossActualAmountKey)
            let budPercVar = doubleValueIn(v, withKey: budPercVarKey)
            let accountDescription = stringValueIn(v, withKey: accountDescriptionKey)
            let actEstVar = doubleValueIn(v, withKey: actEstVarKey)
            
            let document = MutableDocument()
            .setDouble(sub, forKey: subKey)
            .setDouble(grossDivisionEstimateAmount, forKey: grossDivisionEstimateAmountKey)
            .setDouble(budPercVarPct, forKey: budPercVarPctKey)
            .setDouble(budActVarPct, forKey: budActVarPctKey)
            .setDouble(percEstVarPct, forKey: percEstVarPctKey)
            .setString(uniqueID, forKey: uniqueIDKey)
            .setDouble(grossBudgetAmount, forKey: grossBudgetAmountKey)
            .setDouble(budActVar, forKey: budActVarKey)
            .setDouble(budEstVarPct, forKey: budEstVarPctKey)
            .setDouble(gen, forKey: genKey)
            .setDouble(percActVar, forKey: percActVarKey)
            .setDouble(budEstVar, forKey: budEstVarKey)
            .setDouble(grossPercAmount, forKey: grossPercAmountKey)
            .setDouble(percActVarPct, forKey: percActVarPctKey)
            .setDouble(percEstVar, forKey: percEstVarKey)
            .setDouble(actEstVarPct, forKey: actEstVarPctKey)
            .setDouble(grossActualAmount, forKey: grossActualAmountKey)
            .setDouble(budPercVar, forKey: budPercVarKey)
            .setString(accountDescription, forKey: accountDescriptionKey)
            .setDouble(actEstVar, forKey: actEstVarKey)
    
            save(document, databaseName)
        }
    }
    
    func save(_ document: MutableDocument,_ database: String) {
        
        guard let db = getDatabaseWith(name: database) else { return }
        
        // Store 
        do {
            try db.saveDocument(document)
        }
        catch let error { print(error.localizedDescription) }
    }
    
    func delete(_ database: String) {
        
        guard let db = getDatabaseWith(name: database) else { return }

        // Delete
        do {
            try db.delete()
        }
        catch let error { print(error.localizedDescription) }
        
    }

}
