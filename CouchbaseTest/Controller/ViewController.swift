//
//  ViewController.swift
//  CouchbaseTest
//
//  Created by Brandon Askea on 3/21/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit
import CouchbaseLiteSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var objects:[Document] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 500
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    func loadData() {
        
        //Get Database
        guard let database = DatabaseManager.instance.getDatabaseWith(name: databaseName) else { return }
        
        //Form Query
        var query: Query!
        
        let orderings: [OrderingProtocol] = [Ordering.property(ParseKey.sub.string())]
        
        query = QueryBuilder
            .select(SelectResult.expression(Meta.id))
            .from(DataSource.database(database))
            .orderBy(orderings)
        
        self.objects.removeAll()
        
        // Perform Query
        do {
            for result in try query.execute() {
                guard let documentID = result.string(at: 0) else { continue }
                guard let document = database.document(withID: documentID) else { continue }
                objects.append(document)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        // Load Data
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.id) as? DataObjectTableViewCell else { return UITableViewCell() }
        
        // Show Data
        cell.configureWith(objects[indexPath.row])
        return cell
    }
}

