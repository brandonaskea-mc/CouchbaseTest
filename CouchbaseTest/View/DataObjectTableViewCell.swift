//
//  DataObjectTableViewCell.swift
//  CouchbaseTest
//
//  Created by Brandon Askea on 3/21/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit
import CouchbaseLiteSwift

class DataObjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label14: UILabel!
    @IBOutlet weak var label15: UILabel!
    @IBOutlet weak var label16: UILabel!
    @IBOutlet weak var label17: UILabel!
    @IBOutlet weak var label18: UILabel!
    @IBOutlet weak var label19: UILabel!
    @IBOutlet weak var label20: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureWith(_ document: Document) {
        for key in ParseKey.allCases {
            
            // Get label
            guard let label = contentView.subviews.filter({ (subview) -> Bool in
                return subview is UILabel && subview.tag == key.rawValue
            }).first as? UILabel else { continue }
            
            // Get value
            var stringValue = "Unknown"
            if let value = document.string(forKey: key.string()) {
                stringValue = value
            }
            else if let value = document.value(forKey: key.string()) as? Double {
                stringValue = value.description
            }
        
            label.text = "\(key.string()): \(stringValue)"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }

}
