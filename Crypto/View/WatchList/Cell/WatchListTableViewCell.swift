//
//  WatchListTableViewCell.swift
//  Crypto
//
//  Created by Muhammad Ario Bagus on 28/04/21.
//

import UIKit

class WatchListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblCryptoName: UILabel!
    @IBOutlet weak var lblCryptoFullName: UILabel!
    @IBOutlet weak var lblCryptoPrice: UILabel!
    @IBOutlet weak var viewTickerColor: UIView!
    @IBOutlet weak var lblCryptoGain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewTickerColor.layer.cornerRadius = 5
        // Initialization code
    }
    
    func initialize(item : Crypto) {
        lblCryptoName.text = item.cryptoName
        lblCryptoFullName.text = item.cryptoFullName
        lblCryptoPrice.text = item.cryptoPrice
        
        switch item.tickerColor {
        case .green:
            viewTickerColor.backgroundColor = UIColor.systemGreen
            lblCryptoGain.textColor = UIColor.white
            lblCryptoGain.text = "\(item.cryptoGainValue)(+\(item.cryptoGainPercentage)%)"
        case .red:
            viewTickerColor.backgroundColor = UIColor.systemRed
            lblCryptoGain.textColor = UIColor.white
            lblCryptoGain.text = "\(item.cryptoGainValue)(\(item.cryptoGainPercentage)%)"
        default:
            viewTickerColor.backgroundColor = UIColor.white
            lblCryptoGain.textColor = UIColor.gray
            lblCryptoGain.text = "\(item.cryptoGainValue)(\(item.cryptoGainPercentage))"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
