//
//  NewsListTableViewCell.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 29/04/21.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initialize(item : News) {
        lblSource.text = item.source
        lblTitle.text = item.title
        lblBody.text = item.body
    }
    
}

