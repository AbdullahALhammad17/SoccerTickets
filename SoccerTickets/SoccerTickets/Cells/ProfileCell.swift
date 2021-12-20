//
//  ProfileCell.swift
//  SoccerTickets
//
//  Created by iAbdullah17 on 20/12/2021.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var emailUser: UILabel!
    
    @IBOutlet weak var fullName: UILabel!
    
    
    @IBOutlet weak var phoneNumber: UILabel!
    
    
    @IBOutlet weak var cityName: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
